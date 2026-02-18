{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      programs.gh = {
        enable = true;
        gitCredentialHelper.enable = true;
        extensions = with pkgs; [
          gh-stack
        ];
      };
    };
}
