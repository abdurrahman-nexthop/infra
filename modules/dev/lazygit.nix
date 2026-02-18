{
  flake.modules.homeManager.dev = {
    programs.lazygit = {
      enable = true;
      settings = {
        gui.skipDiscardChangeWarning = true;
      };
    };
  };
}
