{ config, pkgs, lib, ... }: {

  # Boot and modules
  nix.settings.cores = 2;
  nix.settings.max-jobs = 2;

  boot.kernelPackages = with pkgs; linuxPackages_xanmod_latest;

  zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 150;
      priority = 10;
    };


  boot = {
    plymouth.enable = true;
    loader = {
      grub.enable = true;
      grub.device = "/dev/sda";
      timeout = 30;
    };

    blacklistedKernelModules =
      [ 

      ];

    kernel.sysctl."vm.swappiness" = 100;
    kernel.sysctl."vm.watermark_scale_factor" = 1000;

    # kernel.sysctl."kernel/sysrq" = 1;
    # kernel.sysctl."abi.vsyscall32" = 0;
    kernelParams = [
      "quiet"
      "vga=773"
      "fsck.mode=force"
      "mitigations=off"
      "i915.mitigations=off"
      "intel_pstate=false"
    ];
  };









}
