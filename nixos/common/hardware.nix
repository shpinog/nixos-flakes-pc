{ pkgs, config, lib, ... }:{

  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.amd.updateMicrocode = true;
  hardware.cpu.intel.updateMicrocode = true;
  services.xserver.videoDriver = ["amdgpu"];



  # systemd.tmpfiles.rules = 
  #   let
  #   rocmEnv = pkgs.symlinkJoin {
  #     name = "rocm-combined";
  #     paths = with pkgs.rocmPackages; [
  #       rocblas
  #         hipblas
  #         clr
  #     ];
  #   };
  # in [
  #   "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  # ];
   systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

   hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      pkgs.amdvlk
      vaapiVdpau
      libvdpau-va-gl
      vulkan-tools
    ];
    extraPackages32 = [
      pkgs.driversi686Linux.amdvlk
    ];
  };
  
environment.sessionVariables = {
  # Существующие переменные...
  AMD_VULKAN_ICD = "RADV";
  RADV_PERFTEST = "sam,gpl"; # Включает Smart Access Memory и другие оптимизации
  __GL_SHADER_DISK_CACHE = "1";
  __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
  MESA_SHADER_CACHE_DIR = "$XDG_CACHE_HOME/mesa_shader_cache";
  MESA_GLSL_CACHE_DIR = "$XDG_CACHE_HOME/mesa_glsl_cache";
};

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };





}
