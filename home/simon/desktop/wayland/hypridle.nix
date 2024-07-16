{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${lib.getExe pkgs.playerctl} -a status | ${lib.getExe pkgs.ripgrep} running -q
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in
{
  services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages.${pkgs.system}.hypridle;
    settings = {
      general = {
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
        lock_cmd = lib.getExe config.programs.hyprlock.package;
        ignore_dbus_inhibit = false; # whether to ignore dbus-sent idle-inhibit requests (used by e.g. firefox or steam)
      };
      listener = [
        {
          timeout = 180;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 3600;
          on-timeout = suspendScript.outPath;
        }
      ];
    };
  };
}
