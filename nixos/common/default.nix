{ inputs, lib, config, pkgs, ... }: {
  
  i18n.defaultLocale = "ru_RU.UTF-8";
console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v16n.psf.gz";
    packages = [ pkgs.terminus_font ];
    keyMap = "us";
};

  time.timeZone = "Europe/Moscow";
  services.udisks2.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common = {
        default = "wlr";
      };
    };
    wlr.enable = true;
  };
  services.joycond.enable = true;
  hardware.xpadneo.enable= true;
  security.rtkit.enable = true;
  services.dbus.enable = true;

  #Distobox
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.podman = {
  enable = true;
  dockerCompat = true;
};
  users.users.shpinog = {
  isNormalUser = true;
  extraGroups = [ "podman" ];
  };


  # #Docker
  # virtualisation.docker.enable = true;
  # users.users.shpinog.extraGroups = [ "docker" ];
  # users.extraGroups.docker.members = [ "shpinog" ];
  # virtualisation.docker.rootless = {
  # enable = true;
  # setSocketVariable = true;
  # };

environment.systemPackages = with pkgs; [
    koboldcpp
    python312Packages.psutil
    psutils
    wakeonlan

    distrobox #distrobox
    gperftools
    cachix
    coreutils
    lm_sensors
    pciutils
    btop
    killall
##Compile
    gcc
    pkg-config
    binutils
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
