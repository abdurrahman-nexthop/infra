{
  flake.modules.nixos.base = {
    networking.proxy = {
      default = "http://cacheproxy.us-west-1.nexthop.ai:8080";
      noProxy = ".internal.nexthop.ai,.us-west-1.nexthop.ai,is101,10.0.0.0/8,localhost,127.0.0.1,0.0.0.0,169.254.0.0/16,172.16.0.0/12,::1";
    };
  };
}
