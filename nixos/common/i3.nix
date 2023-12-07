
{ inputs, lib, config, pkgs, ... }: {

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
  services.xserver = {
    enable = true;
    libinput.enable = true;
    displayManager.startx.enable = true;
    windowManager.i3.package = pkgs.i3-gaps;
    logFile= "/home/shpinog/.Xorg.log";


    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
     ];
    };
  };
  
  }
