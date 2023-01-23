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
    loader = {
      grub.enable = true;
      grub.device = "/dev/sda";
      timeout = 30;
    };

    blacklistedKernelModules =
      [ 

      ];

    # kernel.sysctl."vm.swappiness" = 200;
    # kernel.sysctl."kernel/sysrq" = 1;
    # kernel.sysctl."abi.vsyscall32" = 0;
    kernelParams = [
      "quiet"
      "fsck.mode=force"
      "mitigations=off"
      "intel_pstate=false"
    ];
  };









}
