{ config, ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    includes = [ "${config.home.homeDirectory}/.ssh/extra_config" ];
    extraConfig = '''';
    matchBlocks."git" = {
      host = "github.com gitlab.com";
      user = "git";
      identityFile = "${config.home.homeDirectory}/.ssh/id_rsa";
    };
  };
  services.ssh-agent.enable = true;
}
