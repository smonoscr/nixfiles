{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zoom-us
    glxinfo
    lshw
    sbctl
  ];
}
