{ config, pkgs, lib, ... }: {

  #Gaming response-time
  systemd.tmpfiles.settings = {
    "consistent-response-time-for-gaming" = {
      # "/proc/sys/vm/compaction_proactiveness" = {w = { argument = "0"; }; }; 
      # "/proc/sys/vm/watermark_boost_factor" = {w = { argument = "1"; }; }; 
      # "/proc/sys/vm/min_free_kbytes" = {w = { argument = "1048576"; }; }; 
      # "/sys/vm/watermark_scale_factor" = {w = { argument = "500"; }; }; 
      "/sys/vm/swappiness" = {w = { argument = "10"; }; }; 
      "/sys/kernel/mm/lru_gen/enabled" = {w = { argument = "5"; }; }; 
      # "/proc/sys/vm/zone_reclaim_mode" = {w = { argument = "0"; }; }; 
      "/sys/kernel/mm/transparent_hugepage/enabled" = {w = { argument = "madvise"; }; }; 
      "/sys/kernel/mm/transparent_hugepage/shmem_enabled" = {w = { argument = "advise"; }; }; 
      # "ys/kernel/mm/transparent_hugepage/defrag" = {w = { argument = "never"; }; }; 
      "/proc/sys/vm/page_lock_unfairness" = {w = { argument = "1"; }; }; 
      "/proc/sys/kernel/sched_child_runs_first" = {w = { argument = "0"; }; }; 
      "/proc/sys/kernel/sched_autogroup_enabled" = {w = { argument = "0"; }; }; 
      "/proc/sys/kernel/sched_cfs_bandwidth_slice_us" = {w = { argument = "3000"; }; }; 
      "/sys/kernel/debug/sched/base_slice_ns" = {w = { argument = "3000000"; }; }; 
      "/sys/kernel/debug/sched/migration_cost_ns" = {w = { argument = "500000"; }; }; 
      "/sys/kernel/debug/sched/nr_migrate" = {w = { argument = "1"; }; }; 
      "kernel.numa_balancing" = {w = { argument = "1"; }; }; 
      "vm.zone_reclaim_mode" = {w = { argument = "0"; }; }; 

      }; 
    };
    
  programs.corectrl = {
    enable = true;
    gpuOverclock = {
        enable = true;
        ppfeaturemask = "0xfffd7fff";
      };
  };
  # services.undervolt = {
  #     enable = true;
  #     uncoreOffset = -25;
  #     p1.window = 3;
  #     p2.window = 5;
  #     p1.limit = 200;
  #     p2.limit = 180;
  #
  #   };

  boot.kernelPackages = with pkgs; linuxPackages_xanmod;
  #  boot.extraModulePackages = [
  #   config.boot.kernelPackages.r8168
  # ];

  #Need fo CamDroid
  boot.extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 video_nr=9 Video-Loopback
    '';



# Добавляем правило для устройств i2c
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
    '';

  # # Nvidia driver branch
  # # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
  boot.supportedFilesystems = [ "ntfs" ];

  zramSwap = {
      enable = false;
      algorithm = "zstd";
      memoryPercent = 50;
      priority = 10;
    };


  ### Boot Kernel
  boot = {
    loader = {
      systemd-boot.enable = true;
      # systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.consoleMode = "auto";
      timeout = 30;
      systemd-boot.extraFiles = { "efi/memtest86/memtest.efi" = "${pkgs.memtest86-efi}/BOOTX64.efi"; };
      systemd-boot.extraEntries = { "memtest86.conf" = ''
        title Memtest86+
          efi /efi/memtest86/memtest.efi
          sort-key z_memtest
          ''; };
    };

    blacklistedKernelModules =
      [ 
        "nouveau"
        "radeon"
        "cdc_ncm"
        "r8168"
      ];

    # kernel.sysctl = {
    #   "abi.vsyscall32" = 0;
    #   "kernel/sysrq" = 1;
    # };

    kernelParams = [
      "quiet"
      # "amdgpu.ppfeaturemask=0xfffd7fff"
      "fsck.mode=force"
      "mitigations=off"
      "nohz_full=2-23,26-47"
      "rcu_nocbs=0-1,24-25"
      "rcutree.kthread_prio=1"
      "skew_tick=1"
      "intel_pstate=passive"
      "nmi_watchdog=0"
      # "nvme_core.default_ps_max_latency_us=5500"
      # "amdgpu.virtual_display=0000:05:00.0,1"
      "video=DP-2:1920x1080@144"
      "video=DP-3:3840x2160@61"
      "video=DP-1:2560x1440@180"

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
