{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.module;
in
{
  options.module = {
    enable = mkEnableOption "Enable module";
  };

  config = mkIf cfg.enable {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
