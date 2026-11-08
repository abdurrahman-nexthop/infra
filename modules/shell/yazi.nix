{
  flake.modules.homeManager.shell =
    { config, ... }:
    {
      programs.yazi = {
        enable = true;
        theme.mgr.syntect_theme = "${config.programs.bat.package.src}/assets/themes/ansi.tmTheme";
      };
    };
}
