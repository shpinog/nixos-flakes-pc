{ config, pkgs, ... }:

{
  xdg.mimeApps = {
    enable = true;

    # ==========================================
    # 1. ПРОГРАММЫ ПО УМОЛЧАНИЮ (Двойной клик)
    # ==========================================
    defaultApplications = {
      # Проводник
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];

      # Браузер и ссылки
      "text/html" = [ "librewolf.desktop" ];
      "x-scheme-handler/http" = [ "librewolf.desktop" ];
      "x-scheme-handler/https" = [ "librewolf.desktop" ];
      "x-scheme-handler/about" = [ "librewolf.desktop" ];
      "x-scheme-handler/unknown" = [ "librewolf.desktop" ];

      # Почта
      "x-scheme-handler/mailto" = [ "eu.betterbird.Betterbird.desktop" ];

      # Мессенджеры
      "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];

      # Изображения (Eye of GNOME)
      "image/jpeg" = [ "org.gnome.eog.desktop" ];
      "image/png" = [ "org.gnome.eog.desktop" ];
      "image/gif" = [ "org.gnome.eog.desktop" ];
      "image/webp" = [ "org.gnome.eog.desktop" ];
      "image/svg+xml" = [ "org.gnome.eog.desktop" ];

      # Видео (MPV)
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ]; # .mkv
      "video/webm" = [ "mpv.desktop" ];
      "video/x-msvideo" = [ "mpv.desktop" ]; # .avi
      "video/quicktime" = [ "mpv.desktop" ]; # .mov
      "video/x-flv" = [ "mpv.desktop" ];

      # Аудио (MPV)
      "audio/mpeg" = [ "mpv.desktop" ]; # .mp3
      "audio/x-flac" = [ "mpv.desktop" ];
      "audio/x-wav" = [ "mpv.desktop" ];
      "audio/ogg" = [ "mpv.desktop" ];

      # Архивы (File Roller)
      "application/zip" = [ "org.gnome.FileRoller.desktop" ];
      "application/x-rar" = [ "org.gnome.FileRoller.desktop" ];
      "application/x-7z-compressed" = [ "org.gnome.FileRoller.desktop" ];
      "application/x-tar" = [ "org.gnome.FileRoller.desktop" ];
      "application/gzip" = [ "org.gnome.FileRoller.desktop" ];

      # PDF (Zathura)
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];

      # Текстовые файлы и код (VSCodium)
      "text/plain" = [ "codium.desktop" ];
      "text/markdown" = [ "codium.desktop" ];
      "application/json" = [ "codium.desktop" ];
      "text/x-yaml" = [ "codium.desktop" ];

      # Офисные документы Microsoft (OnlyOffice)
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "org.onlyoffice.desktopeditors.desktop" ]; # .docx
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "org.onlyoffice.desktopeditors.desktop" ]; # .xlsx
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "org.onlyoffice.desktopeditors.desktop" ]; # .pptx

      # Офисные документы OpenDocument (LibreOffice)
      "application/vnd.oasis.opendocument.text" = [ "libreoffice-writer.desktop" ]; # .odt
      "application/vnd.oasis.opendocument.spreadsheet" = [ "libreoffice-calc.desktop" ]; # .ods
      "application/vnd.oasis.opendocument.presentation" = [ "libreoffice-impress.desktop" ]; # .odp

      # Торренты (qBittorrent)
      "application/x-bittorrent" = [ "org.qbittorrent.qBittorrent.desktop" ];
      "x-scheme-handler/magnet" = [ "org.qbittorrent.qBittorrent.desktop" ];
    };

    # ==========================================
    # 2. ДОПОЛНИТЕЛЬНЫЕ ПРОГРАММЫ (Меню "Открыть с помощью...")
    # ==========================================
    associations.added = {
      # Добавим Thunar как запасной проводник
      "inode/directory" = [ "thunar.desktop" ];
      
      # Vivaldi как запасной браузер
      "text/html" = [ "vivaldi-stable.desktop" ];
      "x-scheme-handler/http" = [ "vivaldi-stable.desktop" ];
      "x-scheme-handler/https" = [ "vivaldi-stable.desktop" ];
      
      # Shotwell для фото-менеджмента
      "image/jpeg" = [ "org.gnome.Shotwell.desktop" ];
      "image/png" = [ "org.gnome.Shotwell.desktop" ];
      "image/webp" = [ "org.gnome.Shotwell.desktop" ];
      
      # Альтернативные просмотрщики PDF
      "application/pdf" = [ "org.gnome.Evince.desktop" "librewolf.desktop" "vivaldi-stable.desktop" ];
      
      # Zed как запасной редактор кода
      "text/plain" = [ "dev.zed.Zed.desktop" ];
      "text/markdown" = [ "dev.zed.Zed.desktop" ];
      "application/json" = [ "dev.zed.Zed.desktop" ];
      
      # LibreOffice как запасной для форматов Microsoft
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "libreoffice-writer.desktop" ];
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "libreoffice-calc.desktop" ];
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "libreoffice-impress.desktop" ];
    };
  };
}
