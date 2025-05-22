{ config, pkgs, ... }: {

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Ink";
    size = 32;
  };
  
  gtk = {
    enable = true;
    };

}
