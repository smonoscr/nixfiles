{ pkgs, ... }:
{
  imports = [
    ./settings.nix
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "html"
      "dockerfile"
      "toml"
      "git-firefly"
      "xml"
      "vscode-dark-modern"
      "java"
      "docker-compose"
    ];
  };

  home.packages = with pkgs; [
    nixd
  ];
}
