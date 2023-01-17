{ config, pkgs,inputs, ... }: {

  imports = [
    ./modules/sway.nix
    ./modules/nvim.nix
    ./modules/firefox.nix
    ./modules/foot.nix
    ./modules/fish.nix
    ./modules/waybar.nix
    ./modules/gtk.nix
    ./modules/mpv.nix
    ./modules/environment.nix
    ./modules/packages.nix
    
    
  ];

  programs = {

    bat = {
      enable = true;
      config = { paging = "never"; };
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };


    lsd = {
      enable = true;
      enableAliases = true;
    };


  };
}
