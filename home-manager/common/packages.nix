{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
  
     xorg.xrandr
     wlr-randr
     vivaldi-ffmpeg-codecs
     sublime3-dev
     doublecmd
    # ##vim
    
    # obsidian
    vimPlugins.packer-nvim
    ##
    pavucontrol
    #Media
    okular
    audio-recorder
    oculante
    #
    libreoffice-qt
    swaybg
    #nix
    nixpkgs-fmt
    #
    qbittorrent
    networkmanagerapplet
    peek
    tdesktop
    #System
    du-dust
    duf
    # File Managers
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin

  ];
}
