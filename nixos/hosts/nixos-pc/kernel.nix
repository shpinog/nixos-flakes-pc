{
  config,
  pkgs,
  lib,
  ...
}:
{

  #Gaming response-time
  systemd.tmpfiles.settings = {
    "consistent-response-time-for-gaming" = {
      # "/proc/sys/vm/compaction_proactiveness" = {w = { argument = "0"; }; };
      # "/proc/sys/vm/watermark_boost_factor" = {w = { argument = "1"; }; };
      # "/proc/sys/vm/min_free_kbytes" = {w = { argument = "1048576"; }; };
      # "/sys/vm/watermark_scale_factor" = {w = { argument = "500"; }; };
      "/sys/kernel/mm/lru_gen/enabled" = {
        w = {
          argument = "5";
        };
      };
      # "/proc/sys/vm/zone_reclaim_mode" = {w = { argument = "0"; }; };
      "/sys/kernel/mm/transparent_hugepage/enabled" = {
        w = {
          argument = "always";
        };
      };
      "/sys/kernel/mm/transparent_hugepage/shmem_enabled" = {
        w = {
          argument = "advise";
        };
      };

      "/sys/kernel/mm/transparent_hugepage/defrag" = {
        w = {
          argument = "defer+madvise";
        };
      };
      "/sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none" = {
        w = {
          argument = "0";
        };
      };
      "/proc/sys/vm/page_lock_unfairness" = {
        w = {
          argument = "1";
        };
      };
      "/sys/kernel/debug/sched/nr_migrate" = {
        w = {
          argument = "1";
        };
      };
      "kernel.numa_balancing" = {
        w = {
          argument = "1";
        };
      };

    };
  };

  services.lact = {
    enable = true;
    # gpuOverclock = {
    #   enable = true;
    #   ppfeaturemask = "0xfffd7fff";
    # };
  };
  hardware.amdgpu.initrd.enable = true;
  hardware.amdgpu.overdrive.enable = true;


  boot.kernelPackages = with pkgs; linuxPackages_xanmod_latest;
  services.scx.enable = true;
  services.scx.scheduler = "scx_bpfland";
  services.bpftune.enable = true;

  #Need fo CamDroid
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 video_nr=9 Video-Loopback
  '';

  # Добавляем правило для устройств i2c
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
    "f2fs"
  ];

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 10;
    priority = 100;
  };

  systemd.services.enable-c6 = {
  description = "Enable C6 sleep state for all CPUs";
  wantedBy = [ "multi-user.target" ];
  serviceConfig = {
    Type = "oneshot";
    ExecStart = "${pkgs.bash}/bin/bash -c 'for d in /sys/devices/system/cpu/cpu*/cpuidle/state3/disable; do echo 0 > \"$d\"; done'";
    RemainAfterExit = true;
  };
};

  ### Boot Kernel
  boot = {
    tmp.useTmpfs = true;
    tmp.tmpfsSize = "40G";
    initrd.systemd.enable = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.consoleMode = "max";
      timeout = 0;
      systemd-boot.extraFiles = {
        "efi/memtest86/memtest.efi" = "${pkgs.memtest86-efi}/BOOTX64.efi";
      };
      systemd-boot.extraEntries = {
        "memtest86.conf" = ''
          title Memtest86+
            efi /efi/memtest86/memtest.efi
            sort-key z_memtest
        '';
      };
    };

    blacklistedKernelModules = [
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
      "mitigations=off"
      "amdgpu.dcdebugmask=0x10"
      "nowatchdog"
      "nmi_watchdog=0"
      "intel_pstate=active"
      "video=HDMI-A-1:1920x1080@120"
      "video=DP-3:3840x2160@60"
      "video=DP-1:2560x1440@165"
      "intel_idle.max_cstate=4"
      "processor.max_cstate=4"

    ];

    kernel.sysctl = {
      "kernel.sched_latency_ns" = 4000000;
      "kernel.sched_min_granularity_ns" = 400000;
      "kernel.sched_wakeup_granularity_ns" = 500000;
      "kernel.numa_balancing" = 1;
      "vm.zone_reclaim_mode" = 1;
      "vm.swappiness" = 10;
      "vm.watermark_scale_factor" = 500;
      "vm.compaction_proactiveness" = 0;
      "vm.watermark_boost_factor" = 1;
      "vm.min_free_kbytes" = 5048576;
    };

  };

}
