{
  config,
  ...
}:
{
  flake.modules.nixos."host/cave".imports =
    with config.flake.modules.nixos;
    [
      # Modules
      base
      shell

      # Users
      root
      abdurrahman
    ]
    ++ [
      {
        home-manager.users.abdurrahman.imports = with config.flake.modules.homeManager; [
          base
          dev
          email
          shell
        ];
      }
    ];
}
