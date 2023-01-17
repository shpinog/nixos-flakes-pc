{ config, pkgs, lib, ... }: {

  # Boot and modules
  nix.settings.cores = 12;
  nix.settings.max-jobs = 12;

  boot.kernelPackages = with pkgs; linuxPackages_xanmod;

  # Nvidia driver branch
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;

  boot.initrd.enable = true;
  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci"  "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod"  ];
  boot.initrd.kernelModules = [ "dm-snapshot" "nvme"  ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.supportedFilesystems = [ "ntfs" ];
  zramSwap.enable = false;
  zramSwap.algorithm = "zstd";


  ### Boot Kernel

  # Use the systemd-boot EFI boot loader.
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
