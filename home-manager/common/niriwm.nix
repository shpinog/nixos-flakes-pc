{ inputs, pkgs, config, lib, niri, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  home.packages = with pkgs; [
    xwayland-satellite # XWayland сервер
    wl-clipboard       # Буфер обмена
    libnotify          # Уведомления
    jaq                # JSON процессор (полезно для скриптов)
    wofi
  ];

  # --- Настройка DankMaterialShell ---
  programs.dank-material-shell = {
    enable = true;
    niri = {
    enableSpawn = true;      # Auto-start DMS with niri, if enabled
    };
    # Если нужно явно указать пакет (обычно не требуется, модуль сам выберет):
    # package = inputs.dms.packages.${pkgs.system}.default;
    #
    niri.includes = {
    enable = false;             # Enable config includes hack. Enabled by default.
    };
  };

  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.system}.niri-unstable; # Используем стабильный пакет из nixpkgs, или inputs.niri.packages.${pkgs.system}.niri-stable

    settings = {
      prefer-no-csd = true;
      # --- Окружение ---
      environment = {
        DISPLAY = ":0";
        QT_QPA_PLATFORM = "wayland";
        NIXOS_OZONE_WL = "1";
      };

      # --- Автозапуск ---
      # Важно: используем { command = [...]; } для каждой команды
      spawn-at-startup = [
        { argv = ["${pkgs.udiskie}/bin/udiskie" "--tray"]; }
        { sh = "sleep 3 && steam-run python3 ~/nixos-flakes-pc/home-manager/common/dotfiles/niri_stack_to_n.py"; }
      ];

      # --- Ввод ---
      input = {
        keyboard.xkb = {
          layout = "us,ru";
          options = "grp:caps_toggle";
        };

        mouse = {
         natural-scroll = false;
         accel-speed = 0;
         accel-profile = "flat";
        };
        
        touchpad = {
          tap = true;
          natural-scroll = true;
          dwt = true;
        };

        focus-follows-mouse.enable = true;
      };

      # --- Мониторы ---
      outputs = {
        "DP-1" = {
          mode = { width = 2560; height = 1440; refresh = 165.0; };
          position = { x = 0; y = 0; };
          scale = 1.0;
          variable-refresh-rate = "on-demand";
        };

        "HDMI-A-1" = {
          mode = { width = 1920; height = 1080; refresh = 120.0; };
          position = { x = 640; y = -1080; };
          scale = 1.0;
          variable-refresh-rate = "on-demand";
        };

        "DP-3" = {
          mode = { width = 3840; height = 2160; refresh = 60.0; };
          position = { x = 2560; y = -480; };
          scale = 2.0;
          transform.rotation = 90;
          variable-refresh-rate = "on-demand";
        };
      };

      # --- Внешний вид (Layout) ---
      layout = {
        gaps = 4;
        center-focused-column = "never";

        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];

        default-column-width = { proportion = 0.5; };

        focus-ring = {
          enable = true;
          width = 2;
          active.color = "#6a818f";
          inactive.color = "#595959aa";
        };
        
        border = { enable = false; };
      };

      # --- Правила окон ---
      # Важно: window-rules (множественное число), список объектов
      window-rules = [
        {
          geometry-corner-radius =
            let
            r = 8.0;
            in
          {
            top-left = r;
            top-right = r;
            bottom-left = r;
            bottom-right = r;
          };

          clip-to-geometry = true;
        }
        {
          matches = [{ app-id = "^steam$"; }];
          open-on-output = "HDMI-A-1"; 
          default-column-width = { proportion = 1.0; };
        }
        {
          matches = [{ app-id = "org.telegram.desktop"; }];
          open-on-workspace = "3";
        }
        {
          matches = [{ app-id = "Alacritty"; }];
          open-on-output = "DP-3";
          default-window-height = { proportion = 1. / 2.; };
          default-column-width = { proportion = 1. / 1.; };
        }
        {
          matches = [{ app-id = "firefox"; }];
          open-maximized = true;
          open-on-output = "DP-1";
        }
        {
          matches = [
            { app-id = "pavucontrol"; }
            { app-id = ".blueman-manager-wrapped"; }
            { app-id = "thunar"; title = "File Operation Progress"; }
            { app-id = "mpv"; }
            { title = "Media viewer"; }
            { title = "^Picture-in-Picture$"; }
          ];
          open-floating = true;
        }
      ];

      # --- Бинды ---
      # Важно: используем структуру .action.<действие>
      # Аргументы передаются строкой (если один) или списком (если несколько)
      binds = {
        "Mod+Shift+M".action.quit = { skip-confirmation = true; };
        "Mod+C".action.close-window = {};
        "Mod+F".action.fullscreen-window = {};
        "Mod+Shift+F".action.maximize-column = {};
        "Mod+Shift+Space".action.toggle-window-floating = {};
        
        "Mod+Return".action.spawn = "alacritty";
        "Mod+Q".action.spawn = "firefox";
        "Mod+Shift+Q".action.spawn = "firefox";
        "Mod+KP_Left".action.spawn = "thunar";
        "Mod+KP_Home".action.spawn = "telegram-desktop";
        "Mod+R".action.spawn = ["wofi" "--show" "drun"];
        "Mod+Shift+L".action.spawn = ["dms" "ipc" "call" "lock" "lock"];

        "Mod+Delete".action.screenshot = {};
        "Shift+Print".action.screenshot-screen = {};
        "Ctrl+Print".action.screenshot-window = {};

        # "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05+"];
        # "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05-"];
        # "XF86AudioMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
        # "XF86AudioMicMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"];

        "Mod+Left".action.focus-column-left = {};
        "Mod+Right".action.focus-column-right = {};
        "Mod+Up".action.focus-window-up = {};
        "Mod+Down".action.focus-window-down = {};

        "Mod+Shift+Left".action.move-column-left = {};
        "Mod+Shift+Right".action.move-column-right = {};
        "Mod+Shift+Up".action.move-window-up = {};
        "Mod+Shift+Down".action.move-window-down = {};

        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;

        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        
        "Mod+WheelScrollDown".action.focus-workspace-down = {};
        "Mod+WheelScrollUp".action.focus-workspace-up = {};
      };
    };
  };
}
