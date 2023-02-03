{ pkgs, config, lib, ... }:{

  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;
   hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
  };




}
