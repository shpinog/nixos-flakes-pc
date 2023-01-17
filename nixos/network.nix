{ pkgs, config, lib, ... }: {


  networking.usePredictableInterfaceNames = true;
  networking.useDHCP = false;
  networking.enableIPv6 = false;
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  networking.firewall.allowedTCPPorts = [ 8868 4662 4679 22 ];
  networking.firewall.allowedUDPPorts = [ 8868 4679 4672 69 ];

networking = {
    nameservers = [ "8.8.8.8" ];
  };

}
