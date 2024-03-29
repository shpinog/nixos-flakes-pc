{ inputs, lib, config, pkgs, ... }: {
  
  i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time.timeZone = "Europe/Moscow";
  services.udisks2.enable = true;

environment.systemPackages = with pkgs; [
    cachix
    coreutils
    lm_sensors
    pciutils
    btop
    killall
    gcc
    lm_sensors
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
    nix-prefetch-github
    swappy
  ];
}
