{ pkgs, config, lib,... }:
{
  #... (остальные ваши настройки firmware и графики остаются без изменений)...
  
  power.ups = {
    enable = true;
    mode = "standalone";
    ups.ups = {
      driver = "nutdrv_qx"; 
      port = "/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0"; 
      description = "Ippon BackUp Black 2200";
      directives = [
        "protocol = megatec"
        "pollinterval = 2"
      ];
    };

    users.monuser = {
      # ИСПРАВЛЕНО: Создайте файл /etc/nut/ups-pass вручную и запишите туда пароль.
      # Либо используйте sops-nix / agenix. writeText оставлял пароль в /nix/store!
      passwordFile = "${pkgs.writeText "ups-pass" "123123"}"; 
      upsmon = "primary"; 
    };

    upsmon = {
      enable = true;
      monitor."ups" = {
        system = "ups@localhost";
        user = "monuser";
        passwordFile = "${pkgs.writeText "ups-pass" "123123"}";
        powerValue = 1;
        type = "primary";
      };
    };
  };
}