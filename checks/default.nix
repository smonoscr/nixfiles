{ inputs, ... }:
{
  imports = [
    inputs.git-hooks.flakeModule
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = {
    treefmt = {
      projectRootFile = "flake.nix";
      settings.global.excludes = [
        "machines/fileserver/user-list.nix" # encrypted with git-agecrypt
      ];
      programs = {
        nixfmt.enable = true;
        prettier = {
          enable = true;
          excludes = [
            "*.md"
          ];
        };
      };
    };

    pre-commit = {
      settings = {
        excludes = [
          "flake.lock"
          "CHANGELOG.md"
          "LICENSE"
        ];
        hooks = {
          treefmt = {
            enable = true;
            settings = {
              formatters = [ ];
              "fail-on-change" = false;
            };
          };
          flake-checker.enable = true;
          nil.enable = true;
          deadnix = {
            enable = true;
            settings.edit = true;
          };
          statix.enable = false;
          detect-private-keys.enable = true;
        };
      };
    };
  };
}
