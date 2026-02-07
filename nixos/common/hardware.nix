{
  pkgs,
  config,
  lib,
  ...
}:
{

  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.amd.updateMicrocode = true;
  hardware.cpu.intel.updateMicrocode = true;
  services.xserver.enable = false;
  services.xserver.videoDriver = [ "modesetting" ];
  services.upower.enable = true;

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

  power.ups = {
    enable = true;
    mode = "standalone";

    # Здесь объявляем сам UPS (имя "ups")
    ups = {
      ups = {
        driver = "blazer_ser";
        port = "/dev/ttyUSB0";
        description = "Ippon BackUp Black 2200";
        maxStartDelay = 60;
        directives = ["protocol = megatec"];
      };
    };



    # Пользователи upsd/upsmon (рекомендую passwordFile вместо inline password)
    users = {
      monuser = {
        upsmon = "primary";
        passwordFile = "../../upspass";
      };
    };

    # upsmon конфиг — ВАЖНО: это attribute set, не список
    upsmon = {
      enable = true;

      monitor = {
        ups = {                         # <- имя записи (может совпадать с именем UPS выше)
          system = "ups@localhost";     # <upsname>@<host> — должен совпадать с именем в power.ups.ups
          powerValue = 1;               # обычно 1
          user = "monuser";
          passwordFile = "../../upspass";
        };
      };
    };
  };

}
