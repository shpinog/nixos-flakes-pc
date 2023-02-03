
{ config, pkgs, system, ... }:{
    

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

  };
}
