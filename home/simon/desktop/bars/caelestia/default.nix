{
  inputs,
  mylib,
  pkgs,
  ...
}:
{
  imports = [ inputs.caelestia-shell.homeManagerModules.default ] ++ mylib.scanPaths ./. { };

  home.packages = with pkgs; [
    inputs.quickshell.packages.${system}.default
  ];

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      bar = {
        status = {
          showBattery = false;
          showAudio = true;
        };
        workspaces = {
          showWindows = false;
          shown = 0;
        };
      };
      border = {
        rounding = 10;
        thickness = 5;
      };
      paths.wallpaperDir = "~/pictures/wallpaper";
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
