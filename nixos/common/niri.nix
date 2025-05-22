{ pkgs, config, lib, ... }: {
  programs.niri.package = pkgs.niri-unstable;
  programs.niri.enable = false;
}
