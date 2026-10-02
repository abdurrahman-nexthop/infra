{
  flake.modules.nixos."host/cave" =
    { pkgs, ... }:
    {
      services.openssh.enable = true;
      environment.systemPackages = [ pkgs.ghostty.terminfo ];
      security.sudo.wheelNeedsPassword = false;
      nixpkgs.config.allowUnfree = true;
      networking.firewall.allowedTCPPorts = [ 8080 ];
    };
}
