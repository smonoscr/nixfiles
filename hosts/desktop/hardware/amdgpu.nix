{ pkgs, ... }:
{
  environment = {
    variables = {
      AMD_VULKAN_ICD = "RADV";
      RADV_PERFTEST = "gpl,shader_object";
    };
  };

  environment.etc = {
    "drirc/00-low-latency.conf" = {
      text = ''
        <driconf>
           <device>
               <application name="Default">
                   <option name="vblank_mode" value="0" />
               </application>
           </device>
        </driconf>
      '';
    };
  };

  hardware = {
    amdgpu = {
      legacySupport.enable = false;
      initrd.enable = true;
      opencl.enable = false; # ROCM maybe for LLM
      amdvlk = {
        enable = false; # I am using RADV
        #package = "";
        #settings = "";
        #support32Bit.enable = true;
        #support32Bit.package = [];
        #supportExperimental.enable = false;
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva
        vaapiVdpau
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}
