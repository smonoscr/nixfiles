{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.module.programs.zathura;
in
{
  options.module.programs.zathura = {
    enable = mkEnableOption "Enable zathura";
  };

  config = mkIf cfg.enable {
    programs.zathura = {
      enable = true;
      options = {
        recolor-lightcolor = "rgba(0,0,0,0)";
        default-bg = "rgba(0,0,0,0.7)";

        font = "Inter 12";
        selection-notification = true;

        selection-clipboard = "clipboard";
        adjust-open = "best-fit";
        pages-per-row = "1";
        scroll-page-aware = "true";
        scroll-full-overlap = "0.01";
        scroll-step = "100";
        zoom-min = "10";
      };
    };
  };
}
