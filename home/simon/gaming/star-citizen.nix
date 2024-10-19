{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.gaming.star-citizen;
in
{
  options.module.gaming.star-citizen = {
    enable = mkEnableOption "Enable star-citizen";
  };

  config = mkIf cfg.enable {

    home.packages = with pkgs; [ inputs.nix-gaming.packages.${system}.star-citizen-umu ];
  };
}
