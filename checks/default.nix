{ inputs, ... }:
{
  imports = [
    inputs.git-hooks.flakeModule
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        nixfmt.enable = true;
        prettier = {
          enable = true;
          excludes = [
            ".md"
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
          treefmt.enable = true;
          flake-checker.enable = true;
          nil.enable = true;
          deadnix.enable = true;
          detect-private-keys.enable = true;
        };
      };
    };
  };
}
