{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.module.terminal.programs.btop;
in
{
  options.module.terminal.programs.btop = {
    enable = mkEnableOption "Enable btop";
  };

  config = mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "flat-remix";
        theme_background = false;
      };
    };
  };
}
