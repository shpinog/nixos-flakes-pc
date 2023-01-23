
{ config, pkgs, system, ... }:{

  programs.steam.enable = true;
  

  programs.gamemode = {
    enable  = true;
    enableRenice = true;
  };

}
