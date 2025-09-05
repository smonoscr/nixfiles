{
  config,
  lib,
  inputs,
  pkgs,
  mylib,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    verbose = true;
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension =
      "backup-"
      + pkgs.lib.readFile "${pkgs.runCommand "timestamp" { } "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";

    users.simon.imports = [ ./simon/home.nix ];

    extraSpecialArgs = {
      inherit inputs mylib;
    };

    sharedModules = [
      {
        nix.package = lib.mkForce config.nix.package;
        programs.home-manager.enable = true;

        manual = {
          manpages.enable = false;
          html.enable = false;
          json.enable = false;
        };
        programs = {
          man.enable = false;
          man.package = null;
        };
      }
    ];
  };
}
