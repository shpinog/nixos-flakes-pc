{ config, pkgs, system, ... }:{

environment.systemPackages = with pkgs; [
    coreutils
    killall
    iw
    fd
    gptfdisk
    util-linux
    ddrescue
    udiskie
    usbutils
    glxinfo
    ripgrep
    #Destop
    shotwell
  ];

}

