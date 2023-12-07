{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ./modules.nix
  ];

  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "shpinog";
    homeDirectory = "/home/shpinog";
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Shpinog";
    userEmail = "shpinog@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
