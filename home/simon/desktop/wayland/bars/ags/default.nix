{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib;

let
  cfg = config.module.desktop.wayland.bars.ags;
in
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  options = {
    module.desktop.wayland.bars.ags = {
      enable = mkEnableOption "Enables ags";
    };
  };

  config = mkIf cfg.enable {
    programs.ags = {
      enable = true;
      configDir = ../ags;
      systemd = {
        enable = true;
      };
    };
    home.packages = with pkgs; [
      bun # needed
      dart-sass # needed
      fd # needed
      swww # needed
    ];
  };
}
