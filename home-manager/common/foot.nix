{ config, pkgs, ... }: {

  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        login-shell = "yes";
        shell = "fish";
        font = "DroidSansMono Nerd Font:size=14";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

}
