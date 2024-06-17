{ pkgs, ... }:
{
  imports = [
    ./fwupd.nix
    ./hardware-configuration.nix
    ./bluetooth.nix
    ./amdgpu.nix
    ./wooting.nix
  ];

  hardware.firmware = with pkgs; [
    linux-firmware
    alsa-firmware
  ];
}
