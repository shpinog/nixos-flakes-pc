{ config, pkgs, ... }:
{

  xdg.configFile."sway" = {
    recursive = false;
    source = "${../../dotfiles/nixos-pc/sway}";
  };

  home.packages = with pkgs; [
    swaykbdd
    mako # notification daemon
    grim
    slurp # wayland
    wl-clipboard
    wofi
    # flashfocus
    # autotiling
    jq
    satty
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    checkConfig = false;
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
  };
}
