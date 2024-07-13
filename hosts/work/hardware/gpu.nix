{ pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-vaapi-driver
        intel-media-driver
      ];
      extraPackages32 = with pkgs; [
        intel-vaapi-driver
        intel-media-driver
      ];
    };
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };

  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };

  boot.initrd.kernelModules = [ "i915" ];
}
