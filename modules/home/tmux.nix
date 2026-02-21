{ config, pkgs, ... }:{

  programs.tmux.enable = true;

  xdg.configFile."tmux" = {
    recursive = false;
    source = "${../configFiles/tmux}";
  };
}
  
