 { config, pkgs, ... }:{

  home.packages = with pkgs; [
    jellyfin-ffmpeg
    zathura
    vipsdisp
    xorg.xrandr
    wlr-randr
    vivaldi-ffmpeg-codecs
    sublime3-dev
    vimPlugins.packer-nvim
    pavucontrol
    audio-recorder
    oculante
    libreoffice-qt
    swaybg
    nixpkgs-fmt
    qbittorrent
    networkmanagerapplet
    peek
    tdesktop
    du-dust
    duf
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
  ];
}

