{ config, pkgs, ... }: {

  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        login-shell = "yes";
        shell = "fish";
        font = "Monospace:size=14";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

}
