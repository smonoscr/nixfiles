{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib;

let
  cfg = config.module.desktop.wayland.bar;
in
{
  config = mkIf (cfg == "quickshell") {
    home.packages = [
      inputs.quickshell.packages.${pkgs.system}.default
    ];

    # Place Quickshell config files in ~/.config/quickshell
    xdg.configFile = {
      "quickshell/config.qml".source = ./config.qml;
      "quickshell/style.qml".source = ./style.qml;
      "quickshell/modules".source = ./modules;
    };
  };
}
