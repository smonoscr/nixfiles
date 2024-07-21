{ pkgs, inputs, ... }:
{
  imports = [
    inputs.matugen.nixosModules.default
    ./browser/firefox
    ./desktop/wayland/hyprland
    ./editors
    ./nix
    ./pkgs
    ./programs
    ./secrets
    ./services
    ./terminal
    ./themes
  ];

  home = {
    username = "simon";
    homeDirectory = "/home/simon";
    sessionVariables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
    stateVersion = "23.11";
  };

  # reload system units when changing configs
  systemd.user.startServices = "sd-switch"; # or "legacy" if "sd-switch" breaks again
}
