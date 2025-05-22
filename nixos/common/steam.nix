
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
    enable  = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
        desiredgov = "performance";
        defaultgov = "powersave";
        softrealtime="auto";

      };

# Warning: GPU optimisations have the potential to damage hardware
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        amd_performance_level = "high";
      };

      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
      };
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
