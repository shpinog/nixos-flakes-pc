{ config, pkgs, ... }: {
  services.xserver.xkbOptions = "grp:caps_toggle, grp_led:caps";
  services.xserver.xkbVariant = "winkeys";
  services.xserver.layout = "us,ru(winkeys)";
  services.xserver.displayManager.defaultSession = "awesome";
  services.xserver = {
    enable = false;
    autorun = false;
    libinput.enable = true;
  };
}
