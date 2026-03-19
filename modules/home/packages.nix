{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rclone
    eog
    jellyfin-ffmpeg
    zathura
    vipsdisp
    xrandr
    wlr-randr
    zed-editor
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
