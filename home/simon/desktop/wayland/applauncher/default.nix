{ lib, ... }:

with lib;
{

  options = {
    module.desktop.wayland.applauncher = mkOption {
      type = types.enum [
        "anyrun"
        "sherlock"
      ];
      default = "anyrun";
      description = "Selects which applauncher to use.";
    };
  };

  imports = [
    ./anyrun
    ./sherlock
  ];
}
