{ config, pkgs,inputs, ... }: {

  imports = [
    ../../common/users/nixos-pc/sway.nix
    ../../common/users/nixos-pc/waybar.nix
    ../../common/users/nixos-pc/environment.nix
    ../../common/nvim.nix
    ../../common/firefox.nix
    ../../common/foot.nix
    ../../common/fish.nix
    ../../common/gtk.nix
    ../../common/mpv.nix
    ../../common/xdg.nix
    
    
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
