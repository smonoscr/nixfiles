{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.module.services.dconf;
in
{
  options.module.services.dconf = {
    enable = mkEnableOption "Enable dconf";
  };

  config = mkIf cfg.enable {
    dconf.settings = {
      # this is like a system-wide dark mode switch that some apps respect
      # equivalent of the following dconf command:
      # `conf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"`
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
