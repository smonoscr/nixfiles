{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.editors.zed-editor;
in
{
  imports = [
    ./settings.nix
  ];

  options = {
    module.editors.zed-editor.enable = mkEnableOption "Enables zed-editor";
  };

  config = mkIf cfg.enable {

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
  };
}
