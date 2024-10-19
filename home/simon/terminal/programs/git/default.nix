{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.module.terminal.programs.git;

  email = "13078509-simonoscr@users.noreply.gitlab.com";
  name = "simonoscr";
in
{
  imports = [
    ./aliases.nix
    ./ignores.nix
  ];
  options.module.terminal.programs.git = {
    enable = mkEnableOption "Enable git";
  };

  config = mkIf cfg.enable {

    programs.git = {
      enable = true;
      lfs.enable = true;
      delta = {
        enable = true;
        options.dark = true;
      };
      extraConfig = {
        color.ui = true;
        core.editor = "nvim";
        github.user = name;
        push.autoSetupRemote = true;
        diff.colorMoved = "default";
        gpg = {
          format = "ssh";
          #ssh.allowedSignersFile = config.home.homeDirectory + "/" + config.xdg.configFile."git/allowed_signers".target;
        };
        commit.gpgsign = true;
        pull.rebase = true;
        init.defaultBranch = "main";
        fetch.auto = true;
      };
      userEmail = email;
      userName = name;

      signing = {
        key = "${config.home.homeDirectory}/.ssh/id_ed25519";
        signByDefault = true;
      };
    };
  };
}
