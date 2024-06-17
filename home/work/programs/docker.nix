{ pkgs, ... }:
{
  home.packages = with pkgs; [
    podman
    docker
  ];
}
