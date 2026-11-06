{ inputs, ... }:
{
  flake.modules.nixos.base = {
    imports = [ inputs.rex.nixosModules.default ];

    services.tailscale.enable = true;
    services.rex.loginServer = {
      enable = true;
      tailscaleServe.enable = true;
      accounts.abdurrahman.principals = [ "tailscale:ruslan@babayev.com" ];
    };
  };

  flake.modules.homeManager.base =
    { lib, osConfig, ... }:
    {
      programs.zsh.initContent = ''
        source <(${lib.getExe osConfig.services.rex.package} completion zsh)
      '';
    };
}
