{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ../../modules/home/environment.nix
    ../../modules/home/nvim.nix
    ../../modules/home/firefox.nix
    ../../modules/home/foot.nix
    ../../modules/home/fish.nix
    ../../modules/home/gtk.nix
    ../../modules/home/mpv.nix
    ../../modules/home/xdg.nix
    ../../modules/home/packages.nix
    ../../modules/home/base.nix
    ../../modules/home/psd.nix
    ../../modules/home/nautilus.nix
    ../../modules/home/stylix.nix
    ../../modules/home/niriwm.nix
    ../../modules/home/flatpak.nix
    ../../modules/home/rclone.nix
  ];

  home = {
    username = "shpinog";
    homeDirectory = "/home/shpinog";
    stateVersion = "23.05";
  };

  home.packages = with pkgs; [
    google-chrome
    # inputs.antigravity-nix.packages.${pkgs.system}.google-antigravity-no-fhs
    antigravity-fhs
  ];

  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    verbose = true;
  };

  programs = {
    gpg = {
      enable = true;
      mutableKeys = false;
      mutableTrust = true;
      scdaemonSettings.disable-ccid = true;
    };
    git = {
      enable = true;
      settings = {
        user.Name = "Shpinog";
        user.Email = "shpinog@gmail.com";
      };
    };
    bat = {
      enable = true;
      config.paging = "never";
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  systemd.user.startServices = "sd-switch";
}
