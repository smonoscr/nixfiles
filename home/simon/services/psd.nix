{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.module.services.profile-sync-daemon;
in
{
  options.module.services.profile-sync-daemon = {
    enable = mkEnableOption "Enable profile-sync-daemon";
  };

  config = mkIf cfg.enable {
    services.psd = {
      enable = true;
      browsers = [
        "brave"
        "firefox"
        "zen"
        "zen-twilight"
      ];
    };
  };
}
