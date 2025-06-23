{ config, pkgs, ... }:
{
  boot.kernelModules = [ "uhid" ];

  services = {
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
  };

  users.users.simon.extraGroups = [ "pcscd" ];

  security.pam = {
    u2f = {
      enable = true;
      control = "sufficient";
      settings = {
        origin = "pam://yubikey";
        cue = true;
        interactive = true;
        authfile = config.sops.secrets."yubikey/u2f_keys".path;
      };
    };
    services = {
      login.u2fAuth = true;
      greetd.u2fAuth = true;
    };
  };

  environment.systemPackages = with pkgs; [
    #yubikey-manager
    yubikey-personalization
    age-plugin-yubikey
    yubioath-flutter
  ];
}
