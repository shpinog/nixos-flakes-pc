{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    eog
    jellyfin-ffmpeg
    zathura
    vipsdisp
    xorg.xrandr
    wlr-randr
    sublime3-dev
    pavucontrol
    libreoffice-fresh
    swaybg
    nixpkgs-fmt
    qbittorrent
    networkmanagerapplet
    peek
    udiskie
    telegram-desktop
    dust
    duf
  ];
}
