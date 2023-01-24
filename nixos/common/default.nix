{ inputs, lib, config, pkgs, ... }: {
  
  i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time.timeZone = "Europe/Moscow";

environment.systemPackages = with pkgs; [
    coreutils
    killall
    gcc
    unzip
    wget
    iw
    fd
    sshfs
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
