{  inputs ,config, pkgs, ... }: {

xdg.configFile."hypr/config" = {
    recursive = false;
    source = "${./dotfiles/default/hypr}";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source=~/.config/hypr/config/default.cfg
      '';
  };


  home.packages = with pkgs; [
    swaylock-effects
    swayidle
  ];

  }

