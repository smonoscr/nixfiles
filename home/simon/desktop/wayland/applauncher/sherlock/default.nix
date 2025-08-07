{
  lib,
  config,
  ...
}:
with lib;

let
  cfg = config.module.desktop.wayland.applauncher;
in
{
  config = mkIf (cfg == "sherlock") {
    programs.sherlock = {
      enable = true;
      settings = {
        aliases = {
          WebCord = {
            name = "Discord";
          };
        };
        ignore = ''
          Avahi*
        '';
        launchers = [
          {
            name = "App Launcher";
            type = "app_launcher";
            args = { };
            priority = 1;
            home = true;
          }
        ];
      };
    };
  };
}
