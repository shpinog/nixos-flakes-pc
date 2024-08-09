{ config, pkgs, ... }: { 

xdg.configFile."sway" = {
  recursive = false;
  source = "${../../dotfiles/nixos-pc/sway}";
};

home.packages = with pkgs; [
  swaykbdd
  mako # notification daemon
  grim
  slurp # wayland
  wl-clipboard
  wofi
  flashfocus
  autotiling
  jq
];

wayland.windowManager.sway = {
  enable = true;
  package = pkgs.swayfx;
  checkConfig = false;
  config = rec {
    modifier = "Mod4";
    # Use kitty as default terminal
    terminal = "foot"; 
    startup = [
      # Launch Firefox on start
      # {command = "firefox";}
    ];
  };
};

}
