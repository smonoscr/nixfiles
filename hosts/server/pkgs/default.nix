{ lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      neovim
      btop
      bat
      curl
      dig
      # hypervisor
      qemu
      k9s
      cachix
    ];
    defaultPackages = lib.mkForce [ ]; # no extra default packages are installed
  };
}
