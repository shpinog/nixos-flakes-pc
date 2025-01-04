{ config, pkgs, ... }: {
  fonts = {
    # fontDir.enable = true;
    # enableGhostscriptFonts = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts-emoji
      noto-fonts
      dejavu_fonts
      liberation_ttf
      hackgen-nf-font
      ubuntu_font_family
      powerline-symbols
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
        serif = [ "Ubuntu" ];
        sansSerif = [  "Ubuntu Sans" ];
        monospace = [ "JetBrains Mono Regular"];
        emoji = [  "Noto Color Emoji" "FiraCode Nerd Font" ];

      };
     };
  };

}
