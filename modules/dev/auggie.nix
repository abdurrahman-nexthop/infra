{ inputs, ... }:
{
  flake.modules.homeManager.dev = {
    imports = [ inputs.auggie.homeManagerModules.default ];
    programs.auggie.enable = true;
  };
}
