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
    theme = {
      name = "Yaru-dark";
      package = pkgs.yaru-theme;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "IBM Plex 12";
     };
    };

}
