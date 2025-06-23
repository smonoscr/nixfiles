{
  config,
  lib,
  ...
}:
with lib;

let
  cfg = config.module.programs.ssh;
in
{
  options.module.programs.ssh = {
    enable = mkEnableOption "Enable module";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "no";
      extraConfig = ''
        StrictHostKeyChecking no
        UpdateHostKeys yes
      '';
      matchBlocks = {
        ## example for a host with tpm2 ssh auth
        #"openwrt" = {
        #  host = "192.168.1.1";
        #  user = "root";
        #  identitiesOnly = true;
        #  identityFile = "${config.home.homeDirectory}/.ssh/id_ecdsa.pub";
        #  identityAgent = "/run/user/1000/ssh-tpm-agent.sock";
        #};
        "yubikey-agent" = {
          host = "*.hosts-with-yubikeys.tld";
          identityAgent = "${config.home.homeDirectory}/.yubikey-agent.sock";
        };
      };
    };
  };
}
