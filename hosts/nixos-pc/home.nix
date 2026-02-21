{ inputs, lib, config, pkgs,... }:

{
  imports = [
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
    # Закомментированные вами модули (hyprland/sway) безопасно удалены или лежат в папке
  ];

  home = {
    username = "shpinog";
    homeDirectory = "/home/shpinog";
    stateVersion = "23.05";
  };

  home.packages = with pkgs; [
    google-chrome
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