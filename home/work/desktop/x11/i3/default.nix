{ pkgs, ... }:
{
  imports = [
    ./config.nix
    #../polybar.nix
    ./i3status.nix
  ];
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
  };
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    rofi
    i3blocks
    i3lock
    xautolock
  ];
}
