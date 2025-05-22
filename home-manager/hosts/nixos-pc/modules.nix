{ config, pkgs, ... }: {

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
      ../../common/psd.nix
       # ../../common/hyprland.nix
      ../../common/stylix.nix
      # ../../common/niri.nix

  ];

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
