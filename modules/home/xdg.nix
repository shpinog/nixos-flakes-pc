{ config, pkgs, ... }:

{

  xdg.configFile."mimeapps.list".force = true;
  xdg.mimeApps = {
    enable = true;
    xdg.mimeApps = {
    enable = true;
    defaultApplications = let
      browser = [ "librewolf.desktop" ]; # ИСПРАВЛЕНО: теперь ссылки открываются в LibreWolf
      mpv = [ "mpv.desktop" ];
      eog = [ "org.gnome.eog.desktop" ];
      fileRoller =;
      writer = [ "libreoffice-writer.desktop" ];

      videoFormats = [ "video/x-matroska" "video/mp4" "video/webm" "video/quicktime" "video/x-msvideo" "video/x-flv" "video/x-ms-wmv" "video/mpeg" "video/x-m4v" "video/3gpp" "video/x-matroska-3d" "video/x-ogm" "video/dv" "video/x-theora" ];
      audioFormats = [ "audio/ogg" "audio/mpeg" "audio/x-wav" "audio/x-aiff" "audio/x-flac" "audio/x-vorbis+ogg" "audio/x-opus+ogg" "audio/x-m4a" "audio/x-ms-wma" "audio/ac3" "audio/x-aac" "audio/midi" "audio/x-mod" "audio/x-mpegurl" "audio/x-scpls" "audio/x-ape" "audio/x-wavpack" "audio/x-shorten" "audio/x-speex" "audio/x-voc" "audio/x-tta" ];
      imageFormats = [ "image/jpeg" "image/png" "image/svg+xml" "image/gif" "image/tiff" "image/x-eps" "image/x-psd" "image/bmp" "image/x-icon" "image/webp" "image/x-xcf" "image/x-portable-pixmap" "image/x-portable-graymap" "image/x-portable-bitmap" "image/x-portable-anymap" "image/x-canon-cr2" "image/x-nikon-nef" "image/x-sony-arw" "image/x-adobe-dng" "image/x-fuji-raf" "image/x-panasonic-rw2" "image/x-olympus-orf" ];
      archiveFormats = [ "application/zip" "application/x-gzip" "application/x-bzip" "application/x-bzip2" "application/x-tar" "application/x-xz" "application/x-lzma" "application/x-lzip" "application/x-7z-compressed" "application/x-rar" "application/x-rar-compressed" "application/x-ms-dos-executable" "application/x-msi" "application/x-deb" "application/x-rpm" "application/x-iso9660-image" "application/vnd.android.package-archive" "application/x-apple-diskimage" ];
      officeFormats = [ "application/vnd.oasis.opendocument.text" "application/vnd.openxmlformats-officedocument.wordprocessingml.document" "application/msword" "application/vnd.oasis.opendocument.spreadsheet" "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" "application/vnd.ms-excel" "application/vnd.oasis.opendocument.presentation" "application/vnd.openxmlformats-officedocument.presentationml.presentation" "application/vnd.ms-powerpoint" "application/rtf" "text/plain" "text/x-shellscript" "text/x-python" "text/x-c" "text/x-c++" "text/x-chdr" "text/x-c++hdr" "text/x-java" "text/x-makefile" "text/x-perl" "text/x-ruby" "text/x-sql" "text/x-tex" "text/xml" "text/html" "text/css" "text/javascript" "application/json" "text/x-markdown" "text/x-yaml" ];
    in
      (pkgs.lib.genAttrs videoFormats (_: mpv)) //
      (pkgs.lib.genAttrs audioFormats (_: mpv)) //
      (pkgs.lib.genAttrs imageFormats (_: eog)) //
      (pkgs.lib.genAttrs archiveFormats (_: fileRoller)) //
      (pkgs.lib.genAttrs officeFormats (_: writer)) //
      {
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "text/uri-list" = browser;
        "text/x-uri" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/chrome" = browser;
        "application/x-extension-htm" = [ "vivaldi-stable.desktop" ];
        "application/x-extension-html" = [ "vivaldi-stable.desktop" ];
        "application/xhtml+xml" = [ "vivaldi-stable.desktop" ];
        "application/x-extension-xhtml" = [ "vivaldi-stable.desktop" ];
        "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      };
  };
  };
}
