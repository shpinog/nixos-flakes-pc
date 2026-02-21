{ config, pkgs, ... }:

{
  # Включение Nautilus и необходимых компонентов
  home.packages = with pkgs; [
    pkgs.nautilus # Основной пакет Nautilus

    # Дополнительные функции (эскизы, интеграция):
    pkgs.nautilus-python # Поддержка скриптов Python
    ffmpegthumbnailer # Эскизы для видео
    evince # Просмотр PDF (для эскизов)
    poppler-utils # Дополнительные инструменты для PDF
    pkgs.file-roller # Архиватор (интеграция с Nautilus)
  ];

  # Настройка dconf (если используете GNOME)
  dconf.settings = {
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view"; # или "list-view"
      search-filter-time-type = "last_modified"; # Пример настройки
      show-create-link = true;
      show-delete-permanently = true;
    };
    "org/gnome/nautilus/icon-view" = {
      thumbnail-size = "large"; # Размер эскизов
    };
  };

  # Автозапуск Nautilus (опционально)
  services.gnome-keyring.enable = true; # Для работы с паролями
}
