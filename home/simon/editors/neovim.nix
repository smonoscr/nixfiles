{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.module.editors.neovim;
in
{

  options.module.editors.neovim = {
    enable = mkEnableOption "Enable neovim";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      # now you can use vi, vim, nvim and get always neovim
      viAlias = true;
      vimAlias = true;
    };
  };
}
