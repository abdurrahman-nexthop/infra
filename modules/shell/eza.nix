{
  flake.modules.homeManager.shell = {
    programs.eza = {
      enable = true;
      git = true;
      icons = "auto";
    };
  };
}
