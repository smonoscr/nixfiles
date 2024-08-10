{ config, pkgs, ... }:
let
  # get hostname
  inherit (config.networking) hostName;

  # call the custom Xanmod package
  inherit (pkgs.callPackage ./xanmod.nix { inherit hostName; }) xanmod_custom;
in
{
  imports = [ ./config ];

  # set custom xanmod kernel
  boot.kernelPackages = pkgs.linuxPackagesFor xanmod_custom;
}
