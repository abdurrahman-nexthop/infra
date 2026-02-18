topLevel: {
  flake.modules.homeManager.email =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      accounts.email.accounts.Nexthop = rec {
        primary = true;
        flavor = "gmail.com";
        realName = topLevel.config.flake.meta.users.${config.home.username}.name;
        address = topLevel.config.flake.meta.users.${config.home.username}.email;
        userName = "${address}";
        lieer.enable = true;
        notmuch.enable = true;
        passwordCommand = "${lib.getExe pkgs.pass} ${address}";
        folders.drafts = "mail";
        aerc = {
          enable = true;
          extraAccounts =
            let
              inherit (config.accounts.email) maildirBasePath;
              query-map = pkgs.writeText "query-map" ''
                Inbox=tag:inbox and not tag:trash and not tag:spam
                Archive=not tag:inbox and not tag:trash and not tag:spam
                Unread=tag:unread and not tag:trash and not tag:spam
                Drafts=tag:draft and not tag:trash and not tag:spam
                Sent=tag:sent and not tag:trash and not tag:spam
                Flagged=tag:flagged and not tag:trash and not tag:spam
                Trash=tag:trash
                Spam=tag:spam
              '';
            in
            {
              check-mail = "5m";
              check-mail-cmd = "gmi sync -C ${maildirBasePath}/Nexthop && notmuch new";
              copy-to = "";
              query-map = "${query-map}";
              source = "notmuch://${maildirBasePath}";
              folders-exclude = "mail";
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
