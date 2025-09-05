############################################################################################
## this is the systems configuration file                                                 ##
## use this to configure the system environment, it replaces /etc/nixos/configuration.nix ##
############################################################################################
{ inputs, mylib, ... }:
{

  imports = [
    inputs.chaotic.nixosModules.default
    ../../home/home-manager.nix
  ]
  ++ mylib.scanPaths ./. {
    exclude = [
      "configuration.nix" # exclude self
    ];
  };

  ### DON'T TOUCH!
  system.stateVersion = "23.11";
}
