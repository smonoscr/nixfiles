{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.module.terminal.programs.bat;
in
{
  options.module.terminal.programs.bat = {
    enable = mkEnableOption "Enable bat";
  };

  config = mkIf cfg.enable {
    programs.bat = {
      enable = true;
    };
  };
}
