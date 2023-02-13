{ config, pkgs, ... }: { 

xdg.configFile."sway" = {
  recursive = false;
  source = "${../../dotfiles/nixos-book/sway}";
};

home.packages = with pkgs; [
  swaykbdd
  swayidle
  mako # notification daemon
  grim
  slurp # wayland
  wl-clipboard
  wofi
  fuzzel
  flashfocus
  autotiling
  jq
];


wayland.windowManager.sway = {
  enable = true;
  systemdIntegration = true;
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
