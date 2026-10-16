{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      home.packages = [ (pkgs.callPackage ./_package.nix { }) ];
      home.shellAliases.zg = "ziggity";
    };
}
