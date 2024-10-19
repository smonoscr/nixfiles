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
    inputs.ags.homeManagerModules.ags
    ./aylur.nix
    ./hyprpanel.nix
  ];

  options = {
    module.desktop.wayland.bars.ags = {
      enable = mkEnableOption "Enables ags";
    };
  };

  config = mkIf cfg.enable {
    programs.ags = {
      enable = true;
      systemd = {
        enable = true;
      };
    };
    home.packages = with pkgs; [
      brightnessctl # not working anyway because of OLED but needed for this ags setup
      bun # needed
      dart-sass # needed
      fd # needed
      swww # needed
    ];
  };
}
