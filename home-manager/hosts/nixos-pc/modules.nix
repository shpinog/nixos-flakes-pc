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
      ../../common/packages.nix
      ../../common/chromium.nix
      ../../common/base.nix
  ];
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    google-chrome
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



    };
                              }
