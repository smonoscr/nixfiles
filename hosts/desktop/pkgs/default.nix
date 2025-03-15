{ pkgs, ... }:
{
  environment = {
    homeBinInPath = true;
    systemPackages = with pkgs; [
      wget
      dnsutils
      usbutils
      libarchive
      colmena

      zip
      unzip
      unrar
    ];
  };
}
