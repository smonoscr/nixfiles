{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.module.terminal.shell.bash;
in
{
  options.module.terminal.shell.bash = {
    enable = mkEnableOption "Enable bash";
  };

  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
    };
  };
}
