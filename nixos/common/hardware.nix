{ pkgs, config, lib, ... }:{

  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.intel.updateMicrocode = true;
  services.xserver.videoDriver = ["amdgpu"];


   hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
      vulkan-tools
    ];
  };
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };
  services.upower.enable = true;




}
