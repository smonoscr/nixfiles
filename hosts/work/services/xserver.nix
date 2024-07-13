_: {
  environment.pathsToLink = [ "/libexec" ];

  services = {
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      displayManager = {
        startx.enable = true;
        lightdm.enable = false;
      };
      desktopManager = {
        xterm.enable = false;
      };
    };
  };
}
