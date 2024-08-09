{ pkgs, config, lib, ... }:{

  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.amd.updateMicrocode = true;
  services.xserver.videoDriver = ["amdgpu"];


   hardware.graphics = {
    enable = true;
    enable32Bit = true;
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
