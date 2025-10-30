{ config, pkgs, ... }:

{
  # Явное копирование .desktop-файлов в ~/.local/share/applications
  xdg.configFile = {
    # --- Файловый менеджер ---
    "applications/org.gnome.Nautilus.desktop".source =
      "${pkgs.nautilus}/share/applications/org.gnome.Nautilus.desktop";

    # --- Браузеры ---
    "applications/firefox.desktop".source = "${pkgs.firefox}/share/applications/firefox.desktop";
    "applications/vivaldi-stable.desktop".source =
      "${pkgs.vivaldi}/share/applications/vivaldi-stable.desktop";

    # --- Медиа ---
    "applications/mpv.desktop".source = "${pkgs.mpv}/share/applications/mpv.desktop";
    "applications/vlc.desktop".source = "${pkgs.vlc}/share/applications/vlc.desktop";

    # --- PDF / Офис ---
    "applications/org.pwmt.zathura.desktop".source =
      "${pkgs.zathura}/share/applications/zathura.desktop";
    "applications/libreoffice-writer.desktop".source =
      "${pkgs.libreoffice}/share/applications/libreoffice-writer.desktop";

    # --- Изображения ---
    "applications/org.gnome.eog.desktop".source = "${pkgs.eog}/share/applications/eog.desktop";
    "applications/org.libvips.vipsdisp.desktop".source =
      "${pkgs.vips}/share/applications/vipsdisp.desktop";

    # --- Архивы ---
    "applications/org.gnome.FileRoller.desktop".source =
      "${pkgs.file-roller}/share/applications/file-roller.desktop";
  };

  # Настройки XDG MIME (ассоциации файлов)
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # --- Папки ---
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];

      # --- Веб ---
      "text/uri-list" = [ "firefox.desktop" ];
      "text/x-uri" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/chrome" = [ "firefox.desktop" ];

      # --- HTML ---
      "application/x-extension-htm" = [ "vivaldi-stable.desktop" ];
      "application/x-extension-html" = [ "vivaldi-stable.desktop" ];
      "application/xhtml+xml" = [ "vivaldi-stable.desktop" ];
      "application/x-extension-xhtml" = [ "vivaldi-stable.desktop" ];

      # --- Видео ---
      "video/x-matroska" = [ "mpv.desktop" ]; # .mkv
      "video/mp4" = [ "mpv.desktop" ]; # .mp4
      "video/webm" = [ "mpv.desktop" ]; # .webm
      "video/quicktime" = [ "mpv.desktop" ]; # .mov
      "video/x-msvideo" = [ "mpv.desktop" ]; # .avi
      "video/x-flv" = [ "mpv.desktop" ]; # .flv
      "video/x-ms-wmv" = [ "mpv.desktop" ]; # .wmv
      "video/mpeg" = [ "mpv.desktop" ]; # .mpeg, .mpg
      "video/x-m4v" = [ "mpv.desktop" ]; # .m4v
      "video/3gpp" = [ "mpv.desktop" ]; # .3gp
      "video/x-matroska-3d" = [ "mpv.desktop" ]; # .mk3d
      "video/x-ogm" = [ "mpv.desktop" ]; # .ogm
      "video/dv" = [ "mpv.desktop" ]; # .dv
      "video/x-theora" = [ "mpv.desktop" ]; # .ogv

      # --- Аудио ---
      "audio/ogg" = [ "mpv.desktop" ]; # .ogg
      "audio/mpeg" = [ "mpv.desktop" ]; # .mp3
      "audio/x-wav" = [ "mpv.desktop" ]; # .wav
      "audio/x-aiff" = [ "mpv.desktop" ]; # .aiff, .aif
      "audio/x-flac" = [ "mpv.desktop" ]; # .flac
      "audio/x-vorbis+ogg" = [ "mpv.desktop" ]; # .oga
      "audio/x-opus+ogg" = [ "mpv.desktop" ]; # .opus
      "audio/x-m4a" = [ "mpv.desktop" ]; # .m4a
      "audio/x-ms-wma" = [ "mpv.desktop" ]; # .wma
      "audio/ac3" = [ "mpv.desktop" ]; # .ac3
      "audio/x-aac" = [ "mpv.desktop" ]; # .aac
      "audio/midi" = [ "mpv.desktop" ]; # .mid, .midi
      "audio/x-mod" = [ "mpv.desktop" ]; # .mod
      "audio/x-mpegurl" = [ "mpv.desktop" ]; # .m3u, .m3u8
      "audio/x-scpls" = [ "mpv.desktop" ]; # .pls
      "audio/x-ape" = [ "mpv.desktop" ]; # .ape
      "audio/x-wavpack" = [ "mpv.desktop" ]; # .wv
      "audio/x-shorten" = [ "mpv.desktop" ]; # .shn
      "audio/x-speex" = [ "mpv.desktop" ]; # .spx
      "audio/x-voc" = [ "mpv.desktop" ]; # .voc
      "audio/x-tta" = [ "mpv.desktop" ]; # .tta

      # --- PDF / Офис ---
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "application/vnd.oasis.opendocument.text" = [ "libreoffice-writer.desktop" ]; # .odt
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [
        "libreoffice-writer.desktop"
      ]; # .docx
      "application/msword" = [ "libreoffice-writer.desktop" ]; # .doc
      "application/vnd.oasis.opendocument.spreadsheet" = [ "libreoffice-writer.desktop" ]; # .ods
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [
        "libreoffice-writer.desktop"
      ]; # .xlsx
      "application/vnd.ms-excel" = [ "libreoffice-writer.desktop" ]; # .xls
      "application/vnd.oasis.opendocument.presentation" = [ "libreoffice-writer.desktop" ]; # .odp
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [
        "libreoffice-writer.desktop"
      ]; # .pptx
      "application/vnd.ms-powerpoint" = [ "libreoffice-writer.desktop" ]; # .ppt
      "application/rtf" = [ "libreoffice-writer.desktop" ]; # .rtf
      "text/plain" = [ "libreoffice-writer.desktop" ]; # .txt

      # --- Изображения ---
      "image/jpeg" = [ "org.gnome.eog.desktop" ]; # .jpg, .jpeg
      "image/png" = [ "org.gnome.eog.desktop" ]; # .png
      "image/svg+xml" = [ "org.gnome.eog.desktop" ]; # .svg
      "image/gif" = [ "org.gnome.eog.desktop" ]; # .gif
      "image/tiff" = [ "org.gnome.eog.desktop" ]; # .tiff, .tif
      "image/x-eps" = [ "org.gnome.eog.desktop" ]; # .eps
      "image/x-psd" = [ "org.gnome.eog.desktop" ]; # .psd
      "image/bmp" = [ "org.gnome.eog.desktop" ]; # .bmp
      "image/x-icon" = [ "org.gnome.eog.desktop" ]; # .ico
      "image/webp" = [ "org.gnome.eog.desktop" ]; # .webp
      "image/x-xcf" = [ "org.gnome.eog.desktop" ]; # .xcf (GIMP)
      "image/x-portable-pixmap" = [ "org.gnome.eog.desktop" ]; # .ppm
      "image/x-portable-graymap" = [ "org.gnome.eog.desktop" ]; # .pgm
      "image/x-portable-bitmap" = [ "org.gnome.eog.desktop" ]; # .pbm
      "image/x-portable-anymap" = [ "org.gnome.eog.desktop" ]; # .pnm
      "image/x-canon-cr2" = [ "org.gnome.eog.desktop" ]; # .cr2 (RAW)
      "image/x-nikon-nef" = [ "org.gnome.eog.desktop" ]; # .nef (RAW)
      "image/x-sony-arw" = [ "org.gnome.eog.desktop" ]; # .arw (RAW)
      "image/x-adobe-dng" = [ "org.gnome.eog.desktop" ]; # .dng (RAW)
      "image/x-fuji-raf" = [ "org.gnome.eog.desktop" ]; # .raf (RAW)
      "image/x-panasonic-rw2" = [ "org.gnome.eog.desktop" ]; # .rw2 (RAW)
      "image/x-olympus-orf" = [ "org.gnome.eog.desktop" ]; # .orf (RAW)

      # --- Архивы ---
      "application/zip" = [ "org.gnome.FileRoller.desktop" ]; # .zip
      "application/x-gzip" = [ "org.gnome.FileRoller.desktop" ]; # .gz
      "application/x-bzip" = [ "org.gnome.FileRoller.desktop" ]; # .bz
      "application/x-bzip2" = [ "org.gnome.FileRoller.desktop" ]; # .bz2
      "application/x-tar" = [ "org.gnome.FileRoller.desktop" ]; # .tar
      "application/x-xz" = [ "org.gnome.FileRoller.desktop" ]; # .xz
      "application/x-lzma" = [ "org.gnome.FileRoller.desktop" ]; # .lzma
      "application/x-lzip" = [ "org.gnome.FileRoller.desktop" ]; # .lz
      "application/x-7z-compressed" = [ "org.gnome.FileRoller.desktop" ]; # .7z
      "application/x-rar" = [ "org.gnome.FileRoller.desktop" ]; # .rar
      "application/x-rar-compressed" = [ "org.gnome.FileRoller.desktop" ]; # .rar
      "application/x-ms-dos-executable" = [ "org.gnome.FileRoller.desktop" ]; # .exe (если как архив)
      "application/x-msi" = [ "org.gnome.FileRoller.desktop" ]; # .msi (если как архив)
      "application/x-deb" = [ "org.gnome.FileRoller.desktop" ]; # .deb
      "application/x-rpm" = [ "org.gnome.FileRoller.desktop" ]; # .rpm
      "application/x-iso9660-image" = [ "org.gnome.FileRoller.desktop" ]; # .iso
      "application/vnd.android.package-archive" = [ "org.gnome.FileRoller.desktop" ]; # .apk
      "application/x-apple-diskimage" = [ "org.gnome.FileRoller.desktop" ]; # .dmg

      # --- Текст / Код ---
      "text/x-shellscript" = [ "libreoffice-writer.desktop" ]; # .sh
      "text/x-python" = [ "libreoffice-writer.desktop" ]; # .py
      "text/x-c" = [ "libreoffice-writer.desktop" ]; # .c
      "text/x-c++" = [ "libreoffice-writer.desktop" ]; # .cpp, .cxx
      "text/x-chdr" = [ "libreoffice-writer.desktop" ]; # .h
      "text/x-c++hdr" = [ "libreoffice-writer.desktop" ]; # .hpp
      "text/x-java" = [ "libreoffice-writer.desktop" ]; # .java
      "text/x-makefile" = [ "libreoffice-writer.desktop" ]; # Makefile
      "text/x-perl" = [ "libreoffice-writer.desktop" ]; # .pl
      "text/x-ruby" = [ "libreoffice-writer.desktop" ]; # .rb
      "text/x-sql" = [ "libreoffice-writer.desktop" ]; # .sql
      "text/x-tex" = [ "libreoffice-writer.desktop" ]; # .tex
      "text/xml" = [ "libreoffice-writer.desktop" ]; # .xml
      "text/html" = [ "libreoffice-writer.desktop" ]; # .html
      "text/css" = [ "libreoffice-writer.desktop" ]; # .css
      "text/javascript" = [ "libreoffice-writer.desktop" ]; # .js
      "application/json" = [ "libreoffice-writer.desktop" ]; # .json
      "text/x-markdown" = [ "libreoffice-writer.desktop" ]; # .md
      "text/x-yaml" = [ "libreoffice-writer.desktop" ]; # .yaml, .yml
    };
  };

  # Автоматическое обновление MIME-кэша
  systemd.user.services.update-desktop-db = {
    Unit.Description = "Update desktop database";
    Service = {
      ExecStart = "${pkgs.buildPackages.desktop-file-utils}/bin/update-desktop-database %h/.local/share/applications";
      Type = "oneshot";
    };
    Install.WantedBy = [ "default.target" ];
  };
}
