{ config, pkgs, ... }: {


  fonts = {

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    enableDefaultFonts = true;
    fonts = with pkgs; [
      ubuntu_font_family
      jetbrains-mono
      noto-fonts-emoji
      dejavu_fonts
      font-awesome
      liberation_ttf
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      subpixel.lcdfilter = "default";
      subpixel.rgba = "rgb"; 
      
      hinting = {
        enable = true;
        autohint = true;

      };
      
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [  "Noto Sans" ];
        monospace = [ "JetBrains Mono Regular" "Noto Sans Mono" "Iosevka" ];
        emoji = ["Font Awesome 5 Brands" "Noto Color Emoji" "Font Awesome 5 Free" "Font Awesome 5 Free Solid" ];

      };
    };
  };

}
