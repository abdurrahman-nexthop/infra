{
  flake.modules.nixos."host/cave" = {
    services.openssh.enable = true;
    environment.enableAllTerminfo = true;
    virtualisation.docker.enable = true;
    security.sudo.wheelNeedsPassword = false;
    nixpkgs.config.allowUnfree = true;
  };
}
