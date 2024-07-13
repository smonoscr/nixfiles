{ ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };
  services.blueman.enable = true;

  # https://github.com/NixOS/nixpkgs/issues/114222
  #systemd.user.services.telephony_client.enable = false;
}
