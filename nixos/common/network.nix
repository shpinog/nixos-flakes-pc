{ inputs, lib, config, pkgs, ... }: {

  networking.useDHCP = false;
  networking.enableIPv6 = true;
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  services.nginx.enable = false;
  networking.firewall.checkReversePath = false;
  networking.firewall.allowedTCPPorts = [ 8080 8868 4662 4679 22 47984 47989	47990 4801 3001 5001];
  networking.firewall.allowedUDPPorts = [ 8080 8868 4679 4672 69 47998 47999 48000 3001 5001];

  services.openssh = {
    enable = true;
    settings = {
     PermitRootLogin = "no";
     PasswordAuthentication = true;
    };
  };

  # programs.nm-applet = {
  #   enable = true;
  #   indicator = true;
  # };

  networking = {
    nameservers = [ "77.88.8.8" ];
    resolvconf.useLocalResolver = false;
  };
}
