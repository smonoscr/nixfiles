{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.themes.qt;
in
{
  options.module.themes.qt = {
    enable = mkEnableOption "Enable qt";
  };

  config = mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme = {
        name = "gtk"; # old: gtk4 "qtct"
      };
      style = {
        name = "adwaita-dark";
      };
    };
    home.packages = [
      pkgs.qt6Packages.qt6ct
      pkgs.libsForQt5.qt5ct
    ];
  };
}
