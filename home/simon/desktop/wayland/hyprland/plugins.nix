{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib;

let
  cfg = config.module.desktop.wayland.hyprland.plugins;
in
{

  options = {
    module.desktop.wayland.hyprland.plugins.enable = mkEnableOption "Enables hyprland plugins";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      plugins = with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}; [
        csgo-vulkan-fix
      ];

      settings = {
        plugin = {
          csgo-vulkan-fix = {
            res_w = 1680;
            res_h = 1050;
            class = "cs2";
            #fix_mouse = true;
          };
        };
      };
    };
  };
}
