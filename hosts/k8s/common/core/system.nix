{ lib, ... }:
{
  systemd = {
    enableEmergencyMode = false;
    watchdog = {
      runtimeTime = "15s";
      rebootTime = "30s";
      kexecTime = "1m";
    };
    sleep.extraConfig = ''
      AllowSuspend=no
      AllowHibernation=no
    '';
  };
  services.journald.extraConfig = ''
    SystemMaxUse=100M
    RuntimeMaxUse=50M
  '';

  environment = {
    variables.BROWSER = "echo";
    stub-ld.enable = lib.mkDefault false;
    ldso32 = null;
  };

  fonts.fontconfig.enable = lib.mkDefault false;
}
