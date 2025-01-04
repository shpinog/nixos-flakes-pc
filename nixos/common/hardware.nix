{ pkgs, config, lib, ... }:{

  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.amd.updateMicrocode = true;
  services.xserver.videoDriver = ["amdgpu"];


   hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      pkgs.amdvlk
      vaapiVdpau
      libvdpau-va-gl
      vulkan-tools
      rocmPackages.clr.icd #following for GPU AI acceleration
      rocmPackages.rocm-smi
      rocmPackages.clr
      rocmPackages.hipblas
      rocmPackages.rocblas
      rocmPackages.rocsolver
      rocmPackages.rocm-comgr
      rocmPackages.rocm-runtime
      rocmPackages.rocsparse
    ];
    extraPackages32 = [
      pkgs.driversi686Linux.amdvlk
    ];
  };
  

# Force radv
   environment.variables.AMD_VULKAN_ICD = "RADV";
# Or
# environment.variables.VK_ICD_FILENAMES =
#   "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  services.upower.enable = false;




}
