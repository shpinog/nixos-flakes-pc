{
  config,
  pkgs,
  lib,
  ...
}:
{

  systemd.services.setpci-latency = {
    description = "Set PCI latency timers";
    wantedBy = [ "multi-user.target" ];
    after = [ "systemd-udev-settle.service" ];
    path = [ pkgs.pciutils ]; # Добавляем pciutils в environment
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      ${pkgs.pciutils}/bin/setpci -v -s '*:*' latency_timer=20
      ${pkgs.pciutils}/bin/setpci -v -s '0:0' latency_timer=0
      ${pkgs.pciutils}/bin/setpci -v -d "*:*:04xx" latency_timer=80
    '';
  };

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

  programs.corectrl = {
    enable = true;
    # gpuOverclock = {
    #   enable = true;
    #   ppfeaturemask = "0xfffd7fff";
    # };
  };

  boot.kernelPackages = with pkgs; linuxPackages_6_6;
  chaotic.mesa-git.enable = true;
  # services.scx.enable = true;
  # services.scx.scheduler = "scx_lavd";

  #Need fo CamDroid
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 video_nr=9 Video-Loopback
  '';

  # Добавляем правило для устройств i2c
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

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
      # "amdgpu.ppfeaturemask=0xfffd7fff"
      "fsck.mode=force"
      "mitigations=off"
      # "nohz_full=2-23,26-47"
      # "rcu_nocbs=0-1,24-25"
      # "rcutree.kthread_prio=1"
      # "skew_tick=1"
      # "nmi_watchdog=0"
      "intel_pstate=passive"
      "cpufreq.default_governor=schedutil"
      # "nvme_core.default_ps_max_latency_us=5500"
      # "amdgpu.virtual_display=0000:05:00.0,1"
      "video=DP-2:1920x1080@144"
      "video=DP-3:3840x2160@61,rotate:panel_orientation=right_side_up"
      "video=DP-1:2560x1440@180"

    ];

    kernel.sysctl."vm.swappiness" = 10;
    kernel.sysctl."vm.watermark_scale_factor" = 500;
    kernel.sysctl."vm.compaction_proactiveness" = 0;
    kernel.sysctl."vm.watermark_boost_factor" = 1;
    kernel.sysctl."vm.min_free_kbytes" = 5048576;
    kernel.sysctl."vm.zone_reclaim_mode" = 0;

  };

}
