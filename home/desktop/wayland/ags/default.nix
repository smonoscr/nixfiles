{
  inputs,
  pkgs,
  ...
}: let
  agsConfig =
    pkgs.fetchFromGitHub {
      owner = "Aylur";
      repo = "dotfiles";
      rev = "main";
      sha256 = "1zyly2089l5rgcd4z61n7vln5132iyf1jiljnpadas79j03a8p5p";
    }
    + "/ags";
in {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    swww
    brightnessctl
    bun
    dart-sass
    fd
    inputs.matugen.packages.${system}.default
    gnome.gnome-bluetooth_1_0
  ];

  programs.ags = {
    enable = true;
    configDir = agsConfig;
  };
}
