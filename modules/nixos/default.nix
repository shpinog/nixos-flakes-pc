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
  security.rtkit.enable = true;
  services.dbus.enable = true;

  hardware.xpadneo.enable = true;

  systemd.tmpfiles.rules = [
    "d /mesa_shader_cache 1777 root root -"
  ];

  #Distobox
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  users.users.shpinog = {
    isNormalUser = true;
    extraGroups = [ "podman" "i2c" ];
  };

  services.xserver.videoDrivers = [ "vmware" ];
  virtualisation.vmware.guest.enable = true;
  virtualisation.vmware.host.enable = true;

  environment.systemPackages = with pkgs; [
    amneziawg-tools
    nmap
    psutils
    wakeonlan
    libinput
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
    usbutils
    mesa-demos
    ripgrep
  ];
}
