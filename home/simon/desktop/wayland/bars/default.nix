{ lib, ... }:

with lib;
{

  options = {
    module.desktop.wayland.bar = mkOption {
      type = types.enum [
        "hyprpanel"
        "quickshell"
      ];
      default = "hyprpanel";
      description = "Selects which bar to enable: either 'hyprpanel' or 'quickshell'";
    };
  };

  imports = [
    ./hyprpanel
    ./quickshell
  ];
}
