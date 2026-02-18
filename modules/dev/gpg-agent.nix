{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      services.gpg-agent = {
        enable = true;
        pinentry.package = pkgs.pinentry-curses;
      };
    };
}
