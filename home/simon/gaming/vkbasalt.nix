{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.gaming.vkbasalt;

  xdg.configHome =
    let
      x = builtins.getEnv "XDG_CONFIG_HOME";
    in
    if x != "" then x else "${builtins.getEnv "HOME"}/.config";
in
{
  options.module.gaming.vkbasalt = {
    enable = mkEnableOption "Enable vkbasalt";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.vkbasalt ];

    home.file."${xdg.configHome}/vkBasalt/vkBasalt.conf".text = ''
      effects = cas
      toggleKey = F5
      enableOnLaunch = True
      casSharpness = 0.5
    '';
  };
}
