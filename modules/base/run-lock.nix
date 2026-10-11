{ lib, ... }:
{
  flake.modules.nixos.base = {
    systemd.tmpfiles.rules = lib.mkBefore [
      "d /run/lock 1777 root root -"
    ];
  };
}
