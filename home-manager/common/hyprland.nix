{  inputs ,config, pkgs, ... }: {

xdg.configFile."hypr/config" = {
    recursive = false;
    source = "${./dotfiles/default/hypr}";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    extraConfig = ''
      source=~/.config/hypr/config/default.cfg
      '';
  };

  services.hypridle = {
    enable = true;
    package = pkgs.hypridle;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
      {
        timeout = 900;
        on-timeout = "hyprlock";
      }
      {
        timeout = 1200;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";
      }
      ];
    };
  };

  home.packages = with pkgs; [
    wl-clipboard
    hyprshot
    hypridle
    clipse
  ];

  }

