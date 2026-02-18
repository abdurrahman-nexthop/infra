topLevel: {
  flake.modules.homeManager.email =
    { pkgs, config, ... }:
    {
      accounts.email.accounts.Nexthop = rec {
        primary = true;
        flavor = "gmail.com";
        realName = topLevel.config.flake.meta.users.${config.home.username}.name;
        address = topLevel.config.flake.meta.users.${config.home.username}.email;
        userName = "${address}";
        lieer.enable = true;
        notmuch.enable = true;
        aerc = {
          enable = true;
          extraAccounts =
            let
              inherit (config.accounts.email) maildirBasePath;
              query-map = pkgs.writeText "query-map" ''
                Inbox=tag:inbox and not tag:archived
                Unread=tag:unread
                Drafts=tag:draft
                Sent=tag:sent
                Starred=tag:flagged
                Trash=tag:trash
                Spam=tag:spam
              '';
            in
            {
              check-mail = "5m";
              check-mail-cmd = "gmi sync -C ${maildirBasePath}/Nexthop && notmuch new";
              outgoing = "gmi send -C ${maildirBasePath}/Nexthop -t";
              query-map = "${query-map}";
              source = "notmuch://${maildirBasePath}";
              sent = "Sent";
            };
        };
      };

      programs = {
        gpg.enable = true;
        notmuch = {
          enable = true;
          new.tags = [ ];
          search.excludeTags = [
            "trash"
            "spam"
          ];
        };
        lieer.enable = true;
      };
    };
}
