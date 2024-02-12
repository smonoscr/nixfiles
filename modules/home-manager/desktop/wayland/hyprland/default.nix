{
  inputs,
  lib,
  pkgs,
  hyprland,
  ...
}: {
  imports = [
    ./config.nix
    ../swayidle.nix
    ../swaylock.nix
    #./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd.enable = true;
  };

  fonts.fontconfig.enable = true;

  home.file.".config/wayland-sessions/hyprland.desktop".text = ''
    [Desktop Entry]
    Name=Hyprland
    Exec=Hyprland
    Type=Application
  '';
}
