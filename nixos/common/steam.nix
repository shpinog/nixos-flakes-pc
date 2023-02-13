
{ config, pkgs, system, ... }:{

  programs.steam.enable = true;
  

  programs.gamemode = {
    enable  = true;
    enableRenice = true;
  };
  environment.systemPackages = with pkgs; [
    gnutls
    openldap
    libgpgerror
    freetype
    sqlite
    libxml2
    xml2
  ];
}
