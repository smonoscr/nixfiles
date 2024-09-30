{ pkgs, ... }:
{
  imports = [
    ./browser
    ./desktop/wayland/hyprland
    ./editors
    ./gaming
    ./nix
    ./pkgs
    ./programs
    ./services
    ./terminal
    ./themes
  ];

  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    sessionVariables = {
      SHELL = "${pkgs.fish}/bin/fish";
      BROWSER = "zen";
    };
    stateVersion = "23.11";
  };

  # reload system units when changing configs
  systemd.user.startServices = "sd-switch"; # or "legacy" if "sd-switch" breaks again
}
