{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{

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
  hardware.xpadneo.enable = true;
  security.rtkit.enable = true;
  services.dbus.enable = true;

  #Distobox
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  users.users.shpinog = {
    isNormalUser = true;
    extraGroups = [ "podman" ];
  };

  # users.extraGroups.vboxusers.members = [ "shpinog" ];
  # virtualisation.virtualbox = {
  #   host = {
  #     enable = true;
  #     enableExtensionPack = true;
  #   };
  #   guest = {
  #     enable = true;
  #   };
  #
  # };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "shpinog" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  environment.systemPackages = with pkgs; [
    amneziawg-tools
    nmap
    psutils
    wakeonlan

    distrobox # distrobox
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
