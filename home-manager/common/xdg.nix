{ config, pkgs, ... }: {


  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    systemDirs.data = [
    ];

    mime = {
      enable = true;
    };

    configFile."mimeapps.list".force = true;
    
## Check /etc/profiles/per-user/shpinog/share/applications/mimeinfo.cache
    mimeApps = {
      enable = true;
      defaultApplications = {
        "video/x-matroska" = [ "mpv.desktop" "vlc.desktop" ];
        "video/mp4" = [ "mpv.desktop" "vlc.desktop" ];
        "audio/ogg" = [ "mpv.desktop" "vlc.desktop" ];
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "text/uri-list" = [ "firefox.desktop" ];
        "text/x-uri" = [ "firefox.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/chrome" = [ "firefox.desktop" ];
        "application/x-extension-htm" = [ "vivaldi-stable.desktop" ];
        "application/x-extension-html" = [ "vivaldi-stable.desktop" ];
        "application/xhtml+xml" = [ "vivaldi-stable.desktop" ];
        # "application/x-extension-xhtml" = [ "vivaldi-stable.desktop" ];
        "application/x-extension-xhtml" = [ "vivaldi-stable.desktop" ];
        "application/pdf" = ["org.pwmt.zathura.desktop"]; #pdf
        "image/jpeg" = ["image/ndpi=org.libvips.vipsdisp.desktop"]; #jpg
      };
      associations.added = { };

    };
  };


}
