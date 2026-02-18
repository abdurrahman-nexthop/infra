{ inputs, ... }:
{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      programs.nixvim = {
        imports = [ inputs.nixvim-config.nixvimModule ];

        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        extraPlugins = [
          (import ./_augment-vim.nix pkgs)
        ];
      };
    };
}
