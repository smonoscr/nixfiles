{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.desktop.wayland.hyprland;
in

{
  imports = [
    ./binds.nix
    ./hyprmode.nix
    ./settings.nix
    ./rules.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./shortcuts_info.nix
    ./plugins.nix
  ];

  options = {
    module.desktop.wayland.hyprland.enable = mkEnableOption "Enables hyprland";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      #xwaylandvideobridge #for screensharing xwayland application
      hyprshot # screenshot
      wl-clipboard # wayland clipboard
      hyprpicker # color picker
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      xwayland.enable = true; # true is default, but i set it anyways
      systemd = {
        enable = true;
        variables = [ "--all" ];
        extraCommands = [
          "systemctl --user stop graphical-session.target"
          "systemctl --user start hyprland-session.target"
        ];
      };
    };
  };
}
