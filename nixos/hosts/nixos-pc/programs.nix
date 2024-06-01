
{ config, pkgs, system, ... }:{
    
  services.flatpak.enable = true;

  programs = {

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [thunar-archive-plugin thunar-volman];
    };

    file-roller = {
      enable = true;
    };

    dconf = {
      enable = true;
    };

    droidcam = {
      enable = true;
    };

    adb = {
      enable= true;
      };

  };
}
