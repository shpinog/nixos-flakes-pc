{
  pkgs,
  config,
  lib,
  ...
}:
{

  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.intel.updateMicrocode = true;
  services.xserver.enable = false;
  services.xserver.videoDriver = [ "modesetting" ];
  services.upower.enable = true;
  services.irqbalance.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      libva-vdpau-driver
      libvdpau-va-gl
      vulkan-tools
    ];
    extraPackages32 = [
    ];
  };

  environment.sessionVariables = {
    # Существующие переменные...
    AMD_VULKAN_ICD = "RADV";
    RADV_PERFTEST = "sam,gpl"; # Включает Smart Access Memory и другие оптимизации
    __GL_SHADER_DISK_CACHE = "1";
    __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
    MESA_SHADER_CACHE_DIR = "$XDG_CACHE_HOME/mesa_shader_cache";
    MESA_GLSL_CACHE_DIR = "$XDG_CACHE_HOME/mesa_glsl_cache";
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };
  

  # 2. Основная настройка NUT
  power.ups = {
    enable = true;
    mode = "standalone";

    # Определение самого ИБП (Серверная часть - upsd)
    ups.ups = {
      # ВАЖНО: Твои тесты показали, что работает именно этот драйвер!
      driver = "nutdrv_qx"; 
      port = "/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0"; # Используем симлинк из Udev
      description = "Ippon BackUp Black 2200";
      
      # Настройки, полученные опытным путем
      directives = [
        "protocol = megatec"
        "pollinterval = 2"
        # "default.battery.voltage.high = 27.40" # Раскомментируй для калибровки 100%
        # "default.battery.voltage.low = 20.40"  # Раскомментируй для калибровки 0%
      ];
    };

    # Пользователь для мониторинга (API User)
    users.monuser = {
      passwordFile = "${pkgs.writeText "ups-pass" "123123"}";
      upsmon = "primary"; # Права на управление (выключение системы)
    };

    # Клиент мониторинга (upsmon), который следит за батареей и гасит ПК
    upsmon = {
      enable = true;
      monitor = {
        # Имя 'ups' должно совпадать с именем в ups.ups
        "ups" = {
          system = "ups@localhost";
          user = "monuser";
          passwordFile = "${pkgs.writeText "ups-pass" "123123"}";
          powerValue = 1;
          type = "primary";
        };
      };
    };
  };
  
  # 3. Фикс для сокета (если вдруг ошибка создания папки вернется)
  systemd.tmpfiles.rules = [
    "d /var/state/ups 0770 nut nut -"
    "d /var/lib/nut   0770 nut nut -"
  ];

}
