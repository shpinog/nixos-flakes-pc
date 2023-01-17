{ config, pkgs, ... }: {

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
    gtk3.extraConfig.gtk-cursor-theme-name = "breeze";
  };

}
