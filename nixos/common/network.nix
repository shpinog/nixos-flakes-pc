{ inputs, lib, config, pkgs, ... }: {

  networking.useDHCP = false;
  networking.enableIPv6 = false;
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  networking.firewall.checkReversePath = false;
  networking.firewall.allowedTCPPorts = [ 8868 4662 4679 22 ];
  networking.firewall.allowedUDPPorts = [ 8868 4679 4672 69 ];

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = true;
  };

  programs.nm-applet = {
    enable = true;
    indicator = true;
  };

  networking = {
    nameservers = [ "8.8.8.8" ];
    resolvconf.useLocalResolver = false;
  };
}
