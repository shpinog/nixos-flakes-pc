{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./modules.nix
  ];

  home = {
    username = "shpinog";
    homeDirectory = "/home/shpinog";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;
  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      verbose = true;
    };
  };

  programs = {
    gpg = {
      enable = true;
      mutableKeys = false;
      mutableTrust = true;
      # publicKeys = [
      #   { source=../gpg-pub.key; trust="ultimate"; }
      # ];
    };
  };

  programs.git = {
    enable = true;
    userName = "Shpinog";
    userEmail = "shpinog@gmail.com";
  };

  programs.gpg.scdaemonSettings = {
    disable-ccid = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
