{ config, pkgs, lib, ... }: {

    nixpkgs.config.allowUnfree = true; 
   #  nixpkgs.overlays = [ (final: _: { 
   #    owner = "NixOS";
   #    repo = "nixpkgs";
   #    rev = "7449971a3ecf857b4a554cf79b1d9dcc1a4647d8";
   #    sha256 = "Vi+p4y3wnl0/4gcwTdmCO398kKlDaUrNROtf3GOD2NY=";
   #  }) {localSystem = final.system; config.allowUnfree = true;}; }) ];
   # 
   # hardware.nvidia.package = config.boot.kernelPackages.nvidia_x11_vulkan_beta;
   # boot.kernelPackages = pkgs.nvidia-prime-packages.linuxPackages_xanmod;
   #
  #
  #
  boot.kernelPackages = with pkgs; linuxPackages_xanmod_latest;
  boot.extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 video_nr=9 Video-Loopback
    '';
  #
  # # Nvidia driver branch
  # # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
  boot.supportedFilesystems = [ "ntfs" ];

  zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 50;
      priority = 10;
    };

  ### Boot Kernel
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.consoleMode = "max";
      timeout = 30;
    };
    blacklistedKernelModules =
      [ 
        "nouveau"
      ];
    kernel.sysctl = {
      "abi.vsyscall32" = 0;
      "kernel/sysrq" = 1;
    };

    kernelParams = [
      "quiet"
      "fsck.mode=force"
      "mitigations=off"

    ];


   };

   # ATI power manager profile
   # or echo "performance" > /sys/class/drm/card0/device/power_dpm_state
   # or echo high > /sys/class/drm/card0/device/power_profile
  
   
   

   # systemd.services.radeon_low_power = {
   #   script = ''
   #    echo "high" > /sys/class/drm/card0/device/power_dpm_force_performance_level
   #    echo "performance" >> /sys/class/drm/card0/device/power_dpm_state
   #    echo "high" > /sys/class/drm/card1/device/power_dpm_force_performance_level
   #    echo "performance" >> /sys/class/drm/card1/device/power_dpm_state
   #   '';
   #   wantedBy = [ "multi-user.target" ];
  # };









}
