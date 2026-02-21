
{ config, pkgs, system, ... }:{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
    extraPkgs = pkgs: with pkgs; [ libgdiplus keyutils libkrb5 libpng libpulseaudio libvorbis stdenv.cc.cc.lib libXcursor libXi libXinerama libXScrnSaver /* и остальные пакеты */ ];
    };
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
}
