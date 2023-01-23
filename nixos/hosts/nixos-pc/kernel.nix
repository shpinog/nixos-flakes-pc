{ config, pkgs, lib, ... }: {


  boot.kernelPackages = with pkgs; linuxPackages_xanmod_latest;

  # Nvidia driver branch
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
  boot.supportedFilesystems = [ "ntfs" ];

  zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 150;
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
        "amdgpu"
        "nouveau"
      ];
    kernel.sysctl."kernel/sysrq" = 1;
    kernel.sysctl."abi.vsyscall32" = 0;
    kernelParams = [
      "quiet"
      "fsck.mode=force"
      "mitigations=off"
      "intel_pstate=enable"
      "amdgpu.si_support=0"
    ];
  };









}
