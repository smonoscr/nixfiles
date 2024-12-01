{ pkgs, ... }:
{

  # Enable overclocking and fan control on AMD GPUs
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];

  environment = {
    systemPackages = [ pkgs.lact ];
    #etc = {
    #  "lact/config.yaml" = {
    #    source = lactConfig;
    #    mode = "0644";
    #  };
    #};
  };
  systemd = {
    packages = [ pkgs.lact ];
    services.lactd = {
      enable = true;
      description = "AMDGPU Control Daemon";
      after = [ "multi-user.target" ];
      wantedBy = [ "multi-user.target" ];
    };
  };
}
