{ pkgs, config, lib, ... }: {

  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;

  security.rtkit.enable = true;

  security.pam.services.shpinog.startSession = true;
  security.pam.loginLimits = [
  { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
];
}
