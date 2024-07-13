{
  config,
  lib,
  pkgs,
  ...
}:
let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  #hyprland-session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/share/wayland-sessions";
  sessionsData = config.services.displayManager.sessionData.desktops;
  xsessionsPath = "${sessionsData}/share/xsessions";
  wayland-sessionsPath = "${sessionsData}/share/wayland-sessions";
in
#nixos = "${config.system.nixos.label}";
#kernel = "${config.boot.kernelPackages.kernel.version}";
{
  # greetd DM with tuigreet
  services = {
    greetd = {
      enable = true;
      settings = {
        terminal.vt = 1;
        default_session = {
          user = "simon";
          command = "${tuigreet} --time --asterisks --user-menu --xsessions ${xsessionsPath}";
        };
      };
    };
  };
  security.pam.services.greetd.enableGnomeKeyring = true;
}
