{ inputs, ... }:
{
  flake.modules.nixos.base = {
    imports = [ inputs.rex.nixosModules.default ];

    services.tailscale.enable = true;
    services.rex.loginServer = {
      enable = true;
      tailscaleServe.enable = true;
      accounts.abdurrahman.principals = [
        "peer:1000"
        "tailscale:ruslan@babayev.com"
      ];
    };
  };

  flake.modules.homeManager.base = {
    imports = [ inputs.rex.homeManagerModules.default ];

    programs.rex.enable = true;
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
    };
  };
}
