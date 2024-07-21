{ config, ... }:
let
  email = "13078509-simonoscr@users.noreply.gitlab.com";
  name = "simonoscr";
in
{
  imports = [
    ./aliases.nix
    ./ignores.nix
  ];

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
}
