{
  inputs,
  mylib,
  pkgs,
  ...
}:
{
  imports = mylib.scanPaths ./. { };

  home.packages = with pkgs; [
    inputs.quickshell.packages.${system}.default
    inputs.noctalia.packages.${system}.default
  ];

  systemd.user.services.noctalia = {
    Unit = {
      Description = "noctalia quickshell bar";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "${inputs.noctalia.packages.${pkgs.system}.default}/bin/noctalia-shell";
      Restart = "on-failure";
      RestartSec = "1s";
      Environment = [
        "PATH=${
          pkgs.lib.makeBinPath [
            pkgs.glib
            pkgs.kdePackages.qtbase
          ]
        }"
      ];
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
