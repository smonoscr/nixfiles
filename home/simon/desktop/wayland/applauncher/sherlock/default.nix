{
  lib,
  config,
  inputs,
  ...
}:
with lib;

let
  cfg = config.module.desktop.wayland.applauncher;
in
{
  imports = [
    inputs.sherlock.homeManagerModules.default
  ];

  config = mkIf (cfg == "sherlock") {
    programs.sherlock = {
      enable = true;
      settings = {
        aliases = {
          WebCord = {
            name = "Discord";
          };
        };
        config = {
          debug = {
            try_suppress_warnings = true;
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
