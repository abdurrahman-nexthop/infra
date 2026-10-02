{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        zmx
      ];

      # zmx runs sessions under bash, ignoring $SHELL and the passwd shell.
      programs.bash = {
        enable = true;
        initExtra = ''
          if [ -n "$ZMX_SESSION" ]; then
            PS1="zmx:$ZMX_SESSION\$ "
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
