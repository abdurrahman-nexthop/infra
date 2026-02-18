{
  flake.modules.homeManager.dev =
    {
      pkgs,
      lib,
      ...
    }:
    {
      programs.helix = {
        enable = true;
        extraPackages = with pkgs; [
          marksman
        ];
        languages.language = [
          {
            name = "nix";
            auto-format = true;
            formatter.command = "${lib.getExe pkgs.nixfmt}";
          }
          {
            name = "c";
            auto-format = true;
            formatter.command = "${pkgs.clang-tools}/bin/clang-format";
          }
          {
            name = "cpp";
            auto-format = true;
            formatter.command = "${pkgs.clang-tools}/bin/clang-format";
          }
          {
            name = "protobuf";
            auto-format = true;
            formatter.command = "${pkgs.clang-tools}/bin/clang-format";
          }
          {
            name = "rust";
            auto-format = true;
            formatter.command = "${lib.getExe pkgs.rustfmt}";
          }
        ];
        settings = {
          editor = {
            lsp.display-inlay-hints = true;
            color-modes = true;
            bufferline = "multiple";
            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "underline";
            };
          };
        };
      };
    };
}
