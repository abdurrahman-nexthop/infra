{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        zmx
      ];

      programs.bash = {
        enable = true;
        initExtra = ''
          if [ -n "$ZMX_SESSION" ]; then
            exec zsh -l
          fi
        '';
      };

      programs.starship = {
        settings = {
          format = "\${env_var.ZMX_SESSION}$all";
          env_var.ZMX_SESSION = {
            symbol = " ";
            format = "[$symbol$env_value]($style) ";
            style = "blue bold italic";
          };
        };
      };
    };
}
