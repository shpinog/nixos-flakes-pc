{ inputs, lib, config, pkgs, ... }:
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
  
  programs.git = {
    enable = true;
    userName = "Shpinog";
    userEmail = "shpinog@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}