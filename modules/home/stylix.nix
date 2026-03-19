{
  inputs,
  pkgs,
  config,
  lib,
  stylix,
  ...
}: {
  stylix.targets.sway.enable = false;
  stylix.targets.waybar.enable = true;
  stylix.targets.neovim.enable = false;
  stylix.targets.firefox.profileNames = ["shpinog"];
  stylix.targets.librewolf.profileNames = ["shpinog"];
}
