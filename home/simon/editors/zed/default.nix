{ pkgs, ... }:
{
  imports = [
    ./settings.nix
  ];

  home.packages = with pkgs; [
    zed-editor
    nixd
  ];
}
