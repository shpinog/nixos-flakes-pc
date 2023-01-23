{ inputs, lib, config, pkgs, ... }: {

  networking.useDHCP = false;
  networking.enableIPv6 = false;
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";

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
