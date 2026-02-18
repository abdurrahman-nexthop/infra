topLevel: {
  flake.modules.homeManager.dev =
    { config, pkgs, ... }:
    {
      programs.git = {
        enable = true;
        lfs.enable = true;
        settings = rec {
          user.name = topLevel.config.flake.meta.users.${config.home.username}.name;
          user.email = topLevel.config.flake.meta.users.${config.home.username}.email;
          init.defaultBranch = "main";
          pull.ff = "only";
          push.default = "current";
          sendemail.confirm = "auto";
          credential = builtins.listToAttrs (
            map (
              host: pkgs.lib.nameValuePair host { username = "${config.home.username}-nexthop"; }
            ) config.programs.gh.gitCredentialHelper.hosts
          );
        };
      };
    };
}
