{
  flake.modules.nixos."host/cave" =
    { pkgs, ... }:
    {
      boot.loader.grub.enable = true;
      boot.loader.grub.device = "/dev/sda";
      boot.kernelPackages = pkgs.linuxPackages_6_12;
    };
}
