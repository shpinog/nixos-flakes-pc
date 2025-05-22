
{ config, pkgs, ... }: { 
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    environment.plasma5.excludePackages = with pkgs.libsForQt5; [
        plasma-browser-integration
        oxygen
        ];
    services.displayManager.defaultSession = "plasma";
    services.displayManager.sddm.wayland.enable = true;
  }
