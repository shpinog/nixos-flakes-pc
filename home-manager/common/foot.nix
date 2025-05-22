{ config, pkgs, ... }: {

  programs.foot = {
    enable = true;
    server.enable = false;
    settings = {
      main = {
        term = "foot";
        login-shell = "yes";
        shell = "${pkgs.fish}/bin/fish";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };


}
