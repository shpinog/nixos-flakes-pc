
{ config, pkgs, system, ... }:{

  nixpkgs.config.packageOverrides = pkgs: { 
    steam = pkgs.steam.override { extraPkgs = pkgs: with pkgs; [ 
    libgdiplus keyutils libkrb5 libpng libpulseaudio libvorbis stdenv.cc.cc.lib xorg.libXcursor xorg.libXi xorg.libXinerama xorg.libXScrnSaver 
    ]; }; };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  programs.gamescope.enable = true;
  programs.steam.gamescopeSession.enable = true;
  

  programs.gamemode = {
    enable  = false;
    enableRenice = true;
  };
  environment.systemPackages = with pkgs; [
    gnutls
    openldap
    libgpg-error
    freetype
    sqlite
    libxml2
    xml2
  ];
}
