{
  flake.modules = {
    nixos.shell = {
      programs.fish = {
        enable = true;
      };
    };

    homeManager.shell = {
      programs.fish = {
        enable = true;
        functions = {
          fish_greeting = "";
        };
        interactiveShellInit = ''
          # Manually re-apply the theme with the required flag for fish 4.0
          fish_config theme choose --color-theme=dark "Catppuccin Mocha"
        '';
      };
    };

    darwin.shell =
      { pkgs, ... }:
      {
        environment.shells = [ pkgs.fish ];
      };
  };
}
