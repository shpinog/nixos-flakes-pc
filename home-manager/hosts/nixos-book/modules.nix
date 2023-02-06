{ config, pkgs,inputs, ... }: {

  imports = [
    ../../common/users/nixos-book/sway.nix
    ../../common/users/nixos-book/waybar.nix
    ../../common/users/nixos-book/environment.nix
    ../../common/nvim.nix
    ../../common/firefox.nix
    ../../common/foot.nix
    ../../common/fish.nix
    ../../common/gtk.nix
    ../../common/mpv.nix
    ../../common/xdg.nix
    ../../common/packages.nix
    ../../common/chromium.nix
    
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
