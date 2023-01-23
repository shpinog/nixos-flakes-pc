{ config, pkgs, ... }: {
  fonts = {
    # fontDir.enable = true;
    # enableGhostscriptFonts = true;
    enableDefaultFonts = true;
    fonts = with pkgs; [
      jetbrains-mono
      noto-fonts-emoji
      noto-fonts
      dejavu_fonts
      liberation_ttf
      terminus-nerdfont
      hackgen-nf-font
      powerline-symbols
     (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
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
        monospace = [ "JetBrains Mono Regular" "Noto Sans Mono" ];
        emoji = [  "Noto Color Emoji" ];

      };
     };
  };

}
