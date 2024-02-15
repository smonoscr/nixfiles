{
  inputs,
  lib,
  pkgs,
  hyprland,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./config.nix
    ../swayidle.nix
    ../swaylock.nix
    #./plugins.nix
  ];

  home = {
    packages = with pkgs; [
      seatd
      xwaylandvideobridge
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd = {
      enable = true;
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };

  # start swayidle as part of hyprland, not sway
  systemd.user.services.swayidle.Install.WantedBy =
    lib.mkForce ["hyprland-session.target"];

  fonts.fontconfig.enable = true;

  home.file.".config/wayland-sessions/hyprland.desktop".text = ''
    [Desktop Entry]
    Name=Hyprland
    Exec=Hyprland
    Type=Application
  '';
}
