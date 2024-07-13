{ pkgs, ... }:
{
  services = {
    screen-locker = {
      enable = true;
      inactiveInterval = 10;
      lockCmd = "\${pkgs.i3lock}/bin/i3lock -n -c 000000";
      xautolock.enable = true;
    };

    xidlehook = {
      enable = true;
      detect-sleep = true;
      not-when-audio = true;
      not-when-fullscreen = true;
      #timers = [
      #  {
      #    delay = 60;
      #    command = "xrandr --output \"$PRIMARY_DISPLAY\" --brightness .1";
      #    canceller = "xrandr --output \"$PRIMARY_DISPLAY\" --brightness 1";
      #  }
      #];
    };
  };
}
