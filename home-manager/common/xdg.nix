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

    mimeApps = {
      enable = true;
      defaultApplications = {
        "video/x-matroska" = [ "mpv.desktop" "vlc.desktop" ];
        "video/mp4" = [ "mpv.desktop" "vlc.desktop" ];
        "audio/ogg" = [ "mpv.desktop" "vlc.desktop" ];
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "text/uri-list" = [ "vivaldi-stable.desktop" ];
        "text/x-uri" = [ "vivaldi-stable.desktop" ];
        "x-scheme-handler/http" = [ "vivaldi-stable.desktop" ];
        "x-scheme-handler/https" = [ "vivaldi-stable.desktop" ];
        "x-scheme-handler/chrome" = [ "vivaldi-stable.desktop" ];
        "application/x-extension-htm" = [ "vivaldi-stable.desktop" ];
        "application/x-extension-html" = [ "vivaldi-stable.desktop" ];
        "application/xhtml+xml" = [ "vivaldi-stable.desktop" ];
        # "application/x-extension-xhtml" = [ "vivaldi-stable.desktop" ];
        "application/x-extension-xhtml" = [ "vivaldi-stable.desktop" ];
        "application/pdf" = ["org.pwmt.zathura.desktop"]; #pdf
        "image/jpeg" = ["org.gnome.Shotwell-Viewer.desktop"]; #jpg
      };
      associations.added = { };

    };
  };


}
