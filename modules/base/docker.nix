{
  flake.modules.nixos.base = {
    virtualisation.docker = {
      enable = true;
      daemon.settings = {
        registry-mirrors = [
          "https://docker-mirror.sw.internal.nexthop.ai"
        ];
      };
    };
  };
}
