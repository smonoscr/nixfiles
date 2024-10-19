{
  lib,
  config,
  pkgs,
  ...
}:
with lib;

let
  cfg = config.module.browser.brave;
in
{
  options = {
    module.browser.brave.enable = mkEnableOption "Enables brave";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      brave
    ];
  };
}
