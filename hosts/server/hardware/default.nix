{ pkgs, ... }:
{
  imports = [
    ./fwupd.nix
    ./hardware-configuration.nix
  ];

  hardware.firmware = with pkgs; [ linux-firmware ];
}
