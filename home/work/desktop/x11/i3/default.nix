{ ... }:
{
  imports = [
    ./config.nix
    ./i3status.nix
    #../lock.nix
    ../rofi.nix
  ];
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
  };
}
