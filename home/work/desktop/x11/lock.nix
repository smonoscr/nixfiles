{ ... }:
{
  services.screen-locker = {
    enable = true;
    inactiveInterval = 3;
    lockCmd = "i3lock -c 000000";
    xautolock.enable = false;
    xss-lock.enable = false;
  };

  services.xidlehook = {
    not-when-audio = true;
    not-when-fullscreen = true;
  };
}
