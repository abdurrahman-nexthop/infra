{
  flake.modules.nixos."host/cave" = {
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
  };
}
