{
  lib,
  config,
  inputs,
  ...
}:

with lib;

let
  cfg = config.module.desktop.wayland.bars.ags.aylur;

  # use folder from non-flake input
  agsDirectory = inputs.agsdotfiles.outPath + "/ags";
in
{
  options = {
    module.desktop.wayland.bars.ags.aylur = {
      enable = mkEnableOption "Enables ags";
    };
  };

  config = mkIf cfg.enable {
    programs.ags = {
      #configDir = agsConfig;
      configDir = agsDirectory;
      systemd = {
        enable = true;
        busName = "hypr";
      };
    };
  };
}
