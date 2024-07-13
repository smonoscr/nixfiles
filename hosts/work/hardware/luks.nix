{ ... }:
{
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-uuid/06ca0895-ca77-48ab-9471-1fa5091f0a47";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
