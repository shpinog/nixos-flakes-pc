{ inputs, pkgs, config, lib, stylix, ... }: {

  
  home.packages = with pkgs; [
    xwayland-satellite
  ];

  programs.niri.settings = {
    prefer-no-csd = true;
    environment = {
        DISPLAY = ":0";
      };
    spawn-at-startup = [
      # {command = [(lib.getExe pkgs.swaybg) "-i" config.stylix.blurred-image];}
      {command = [(lib.getExe pkgs.waybar)]; }
      {command = [(lib.getExe pkgs.xwayland-satellite)]; }
    ];
    outputs = {
      "PNP(SAC) G72 0000000000000" = {
        mode = {
            width = 2560;
            height = 1440;
            refresh = 143.998993;
          };
        scale = 1.0;
        position.x = 0;
        position.y = 1080;
        variable-refresh-rate= true;
        };

      "Microstep MSI G2412 0x0000310C" = {
        mode = {
            width = 1920;
            height = 1080;
            refresh = 143.998;
          };
        scale = 1.0;
        position.x = 640;
        position.y = 0;
        variable-refresh-rate= true;
        };

      "IPS, Inc. (Intellectual Property Solutions, Inc.) DP 0x00000001" = {
        mode = {
            width =  3840;
            height = 2160;
            refresh = 61.029;
          };
        scale = 2.0;
        position.x = 2560;
        position.y = 600;
        variable-refresh-rate= true;
        transform.rotation = 90;
        };
    };
    
    input = {
      focus-follows-mouse.enable = true;
      keyboard = {
        xkb = {
          layout = "us,ru";
          options = "grp:caps_toggle";
        };
      };

      touchpad = {
        tap = true;
        natural-scroll = true;
      };
    };

    layout = {
      preset-column-widths = [
      { proportion = 1.0 / 3.0; }
      { proportion = 1.0 / 2.0; }
      { proportion = 2.0 / 3.0; }
      ];
      default-column-width = {
        proportion = 0.5;
      };
    };
    # window-rules = {
    #
    #     geometry-corner-radius = 12;
    #     clip-to-geometry = true;
    #   default-window-height = {
    #     proportion = 0.5;
    #   };
    #   min-width = 1060;
    #   open-maximized = true;
    # };
    # window-rules = [
    #   {
    #     matches = [
    #       {
    #         app-id = "Alacritty";
    #
    #       }
    #     ];
    #     open-on-output = "DP-3";
    #   }
    # ];

    window-rules = [
    { matches = [{ app-id = "Alacritty"; }]; open-on-output = "DP-3"; }
    { matches = [{ app-id = "org.gnome.NautilusDevel"; }]; open-on-output = "DP-3"; }
    ];

    binds = with config.lib.niri.actions; {
    "Mod+R".action = spawn "wofi" "--show" "drun";
    "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"];
    "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"];
    "Mod+Return".action.spawn = "alacritty";
    "Mod+KP_Left".action.spawn = ["flatpak" "run" "org.gnome.NautilusDevel"];
    "Mod+Shift+E".action.quit.skip-confirmation = true;
    "Mod+TAB" = { repeat = false; action = toggle-overview; };
    "Mod+C".action = close-window;



    "Mod+Shift+R".action = switch-preset-window-height;
    "Mod+Ctrl+R".action = reset-window-height;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;

    "Mod+V".action = toggle-window-floating;

    "Mod+Shift+P".action = power-off-monitors;

    "Print".action = screenshot;
    "Ctrl+Print".action.screenshot-screen = [];
    "Alt+Print".action = screenshot-window;

    "Mod+Left".action = focus-column-left;
    "Mod+Down".action = focus-window-down;
    "Mod+Up".action = focus-window-up;
    "Mod+Right".action = focus-column-right;
    "Mod+H".action = focus-column-left;
    "Mod+J".action = focus-window-down;
    "Mod+K".action = focus-window-up;
    "Mod+L".action = focus-column-right;

    "Mod+Ctrl+Left".action = move-column-left;
    "Mod+Ctrl+Down".action = move-window-down;
    "Mod+Ctrl+Up".action = move-window-up;
    "Mod+Ctrl+Right".action = move-column-right;
    "Mod+Ctrl+H".action = move-column-left;
    "Mod+Ctrl+J".action = move-window-down;
    "Mod+Ctrl+K".action = move-window-up;
    "Mod+Ctrl+L".action = move-column-right;

    "Mod+Shift+Left".action = focus-monitor-left;
    "Mod+Shift+Down".action = focus-monitor-down;
    "Mod+Shift+Up".action = focus-monitor-up;
    "Mod+Shift+Right".action = focus-monitor-right;
    "Mod+Shift+H".action = focus-monitor-left;
    "Mod+Shift+J".action = focus-monitor-down;
    "Mod+Shift+K".action = focus-monitor-up;
    "Mod+Shift+L".action = focus-monitor-right;

    "Mod+WheelScrollDown" = { cooldown-ms = 150; action = focus-workspace-down; };
    "Mod+WheelScrollUp" = { cooldown-ms = 150; action = focus-workspace-up; };
    "Mod+Ctrl+WheelScrollDown" = { cooldown-ms = 150; action = move-column-to-workspace-down; };
    "Mod+Ctrl+WheelScrollUp" = { cooldown-ms = 150; action = move-column-to-workspace-up; };

    "Mod+1".action = { focus-workspace = 1; };
    "Mod+2".action = { focus-workspace = 2; };
    "Mod+3".action = { focus-workspace = 3; };
    "Mod+4".action = { focus-workspace = 4; };
    "Mod+5".action = { focus-workspace = 5; };
    "Mod+6".action = { focus-workspace = 6; };
    "Mod+7".action = { focus-workspace = 7; };
    "Mod+8".action = { focus-workspace = 8; };
    "Mod+9".action = { focus-workspace = 9; };

    "Mod+Ctrl+1".action = { move-column-to-workspace = 1; };
    "Mod+Ctrl+2".action = { move-column-to-workspace = 2; };
    "Mod+Ctrl+3".action = { move-column-to-workspace = 3; };
    "Mod+Ctrl+4".action = { move-column-to-workspace = 4; };
    "Mod+Ctrl+5".action = { move-column-to-workspace = 5; };
    "Mod+Ctrl+6".action = { move-column-to-workspace = 6; };
    "Mod+Ctrl+7".action = { move-column-to-workspace = 7; };
    "Mod+Ctrl+8".action = { move-column-to-workspace = 8; };
    "Mod+Ctrl+9".action = { move-column-to-workspace = 9; };



  };
  };
}
