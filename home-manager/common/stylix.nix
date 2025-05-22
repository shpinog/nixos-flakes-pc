{ inputs, pkgs, config, lib, stylix, ... }: {
  stylix.targets.sway.enable = false;
  stylix.targets.waybar.enable = false;
  stylix.targets.neovim.enable = false;
}

