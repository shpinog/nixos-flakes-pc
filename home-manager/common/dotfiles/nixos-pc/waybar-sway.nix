{ config, pkgs, ... }:

{
  home.packages = [ pkgs.waybar ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "bottom";
        exclusive = true;
        position = "bottom";
        height = 16;

        modules-left = [ "sway/workspaces" ];
        modules-right = [
          "custom/scratchpad_indicator"
          "pulseaudio"
          "cpu"
          "memory"
          "temperature#cpu0"
          "temperature#cpu1"
          "temperature#gpu1"
          "temperature#gpu2"
          "keyboard-state"
          "sway/language"
          "battery"
          "clock"
          "custom/separator"
          "tray"
          "custom/separator"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          format = "{name}: {icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };

        "keyboard-state" = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            "locked" = "";
            "unlocked" = "";
          };
        };

        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };


        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            "activated" = "";
            "deactivated" = "";
          };
        };

        "custom/separator" = {
          "format" = " ";
          "tooltip" = false;
          "interval" = "once";
          };

        "tray" = {
          spacing = 10;
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        "cpu" = {
          format = "{usage}% ";
          tooltip = false;
        };

        "memory" = {
          format = "{}% ";
        };

        "temperature#cpu0" = {
          hwmon-path = "/sys/class/hwmon/hwmon6/temp1_input";
          critical-threshold = 80;
          format-critical = "CPU0-1: {temperatureC}°C ";
          format = "CPU0: {temperatureC}°C ";
          interval = 1;
        };

        "temperature#cpu1" = {
          hwmon-path = "/sys/class/hwmon/hwmon7/temp1_input";
          critical-threshold = 80;
          format-critical = "|: {temperatureC}°C ";
          format = "CPU1: {temperatureC}°C ";
          interval = 1;
        };

        "temperature#gpu1" = {
          hwmon-path = "/sys/class/hwmon/hwmon0/temp1_input";
          critical-threshold = 85;
          format-critical = "GPU1: {temperatureC}°C";
          format = "GPU: {temperatureC}°C";
          interval = 1;
        };

        "temperature#gpu2" = {
          hwmon-path = "/sys/class/hwmon/hwmon0/temp2_input";
          critical-threshold = 105;
          format-critical = "GPU2: {temperatureC}°C";
          format = "|J: {temperatureC}°C";
          interval = 1;
        };

        "network" = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}%  ";
          format-source-muted = "";
          format-icons = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };
      };
    };

    # Здесь вы можете добавить стиль CSS, если он у вас есть
    style = ''
      /* Ваш CSS стиль */
    '';
  };
}

