{
  flake.modules.nixos."host/cave" = {
    services.openssh.enable = true;
    environment.enableAllTerminfo = true;
    security.sudo.wheelNeedsPassword = false;
    nixpkgs.config.allowUnfree = true;
  };
}
