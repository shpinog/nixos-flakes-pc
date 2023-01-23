# home config
{ config, pkgs, ... }:
let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";

  hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
in
{
  imports = [
    hyprland.homeManagerModules.default
  ];

  # xdg.configFile."hypr" = {
  #   recursive = false;
  #   source = "/home/shpinog/.config/nixpkgs/configFiles/hypr";
  # };

  wayland.windowManager.hyprland = {
    enable = false;
    nvidiaPatches = true;
  };

  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock"; }
      { event = "lock"; command = "lock"; }
    ];
    timeouts = [{ timeout = 60; command = "${pkgs.swaylock}/bin/swaylock -fF"; }];
  };

  programs.swaylock.settings = {

    color = "808080";
    font-size = 24;
    indicator-idle-visible = false;
    indicator-radius = 100;
    # line-color = "ffffff";
    show-failed-attempts = true;
    screenshots = true;
    clock = true;
    effect-blur = "3x10";
  };

  home.packages = with pkgs; [
    swaylock-effects
    swayidle
  ];
}
