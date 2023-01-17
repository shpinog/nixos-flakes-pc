{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ##vim
    rnix-lsp
    vimPlugins.packer-nvim
    ##
    pavucontrol
    #Media
    okular
    audio-recorder
    #
    github-desktop
    libreoffice-qt
    #nix
    nixpkgs-fmt
    #
    qbittorrent
    networkmanagerapplet
    peek
    tdesktop
    # File Managers
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin

  ];
}
