{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.module.programs.mpv;
in
{
  options.module.programs.mpv = {
    enable = mkEnableOption "Enable mpv";
  };

  config = mkIf cfg.enable {
    programs.mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      config = {
        border = false;
        gpu-context = "wayland";
        hwdec = "auto";
        osc = false;
        profile = "gpu-hq";
        vo = "gpu";
      };
    };
  };
}
