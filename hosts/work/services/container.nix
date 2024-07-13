{ pkgs, ... }:
{
  virtualisation = {
    containers = {
      enable = true;
      cdi.dynamic.nvidia.enable = true;
    };
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket = true;
      networkSocket.enable = true;
      autoPrune.enable = false;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  environment.systemPackages = with pkgs; [
    dive
    podman-tui
  ];
}
