{ config, ... }:
{
  flake = {
    meta.users = {
      abdurrahman = {
        email = "abdurrahman@nexthop.ai";
        name = "Abdurrahman Hussain";
        username = "abdurrahman";
      };
    };

    modules.nixos.abdurrahman =
      { pkgs, ... }:
      {
        programs.fish.enable = true;

        users.users.abdurrahman = {
          description = config.flake.meta.users.abdurrahman.name;
          isNormalUser = true;
          createHome = true;
          extraGroups = [
            "wheel"
            "docker"
          ];
          shell = pkgs.fish;
          initialPassword = "id";
        };

        nix.settings.trusted-users = [ config.flake.meta.users.abdurrahman.username ];
      };
  };
}
