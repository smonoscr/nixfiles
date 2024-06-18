{ config, ... }:
{
  programs.ssh = {
    enable = true;
    includes = [ "${config.home.homeDirectory}/.ssh/extra_config" ];
    extraConfig = ''
      PreferredAuthentications publickey
      IdentityFile ${config.home.homeDirectory}/.ssh/id_rsa
    '';
  };
}
