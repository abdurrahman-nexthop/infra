{
  flake.modules =
    let
      stateVersion = "26.05";
    in
    {
      homeManager.base = {
        home = {
          inherit stateVersion;
        };
      };

      nixos.base = {
        system = {
          inherit stateVersion;
        };
      };
    };
}
