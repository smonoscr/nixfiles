{
  lib,
  config,
  pkgs,
  ...
}:
with lib;

let
  cfg = config.module.desktop.wayland.bars.ags.hyprpanel;
in
{
  options = {
    module.desktop.wayland.bars.ags.hyprpanel = {
      enable = mkEnableOption "Enables ags";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprpanel
    ];
  };
}
