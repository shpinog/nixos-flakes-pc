
{ inputs, pkgs, config, lib, niri, ... }:{

  imports = [
  inputs.dms.nixosModules.greeter
  ];

  systemd.services.greetd.serviceConfig = {
    # "-" в начале означает: "попытайся выполнить, но если никого не нашел (ошибка), 
    # то не останавливай запуск, иди дальше".
    # Мы используем pkill -KILL (аналог -9), чтобы убить наверняка.
    ExecStartPre = "-${pkgs.procps}/bin/pkill -KILL niri";
    
    # Можно также добавить это, чтобы systemd был более агрессивен при остановке
    KillSignal = "SIGKILL";
    KillMode = "control-group";
  };

  programs.niri = {
    enable = true;
    # Обязательно используй тот же пакет из flake, что и в HM
    package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  };

  programs.dank-material-shell.greeter = {
  enable = true;
  compositor = {
    name = "niri"; # Required. Can be also "hyprland" or "sway"
    customConfig = ''
        cursor {
            xcursor-theme "Adwaita"
            xcursor-size 24
        }
        // Монитор 1: Центр
        output "DP-1" {
            mode "2560x1440@165"
            position x=0 y=0
        }

        // Монитор 2: Верх
        output "HDMI-A-1" {
            mode "1920x1080@120"
            position x=640 y=-1080
        }

        // Монитор 3: Правый (4K, повернуть на 90 градусов)
        output "DP-3" {
            mode "3840x2160@60"
            position x=2560 y=-480
            scale 2.0
            transform "90"
        }
        
        // Помогает избежать проблем с сессиями внутри греетера
        spawn-at-startup "dbus-update-activation-environment" "--all"
      '';
  };

  # Sync your user's DankMaterialShell theme with the greeter. You'll probably want this
  # configHome = "/home/shpinog";

  # Custom config files for non-standard config locations
  # configFiles = [
  #   "/home/shpinog/.config/DankMaterialShell/settings.json"
  # ];

  # Save the logs to a file
  logs = {
    save = true; 
    path = "/tmp/dms-greeter.log";
  };

  # Custom Quickshell Package    
  quickshell.package = pkgs.quickshell;
};
}
