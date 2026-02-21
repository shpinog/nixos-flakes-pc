{
  config,
  pkgs,
  system,
  ...
}:
{

  services.flatpak.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;

  };
  programs.appimage.package = pkgs.appimage-run.override { extraPkgs = pkgs: [
    pkgs.icu
      pkgs.libxcrypt-legacy
      pkgs.python312
      pkgs.python312Packages.torch
  ]; };


  programs = {

    weylus = {
      enable = true;
      users = [ "shpinog" ];
      openFirewall = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs; [
          thunar-archive-plugin
          thunar-volman
          thunar-media-tags-plugin
    ];
    };


    dconf = {
      enable = true;
    };

    droidcam = {
      enable = true;
    };

  };
}
