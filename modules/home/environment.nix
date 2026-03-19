{
  config,
  pkgs,
  lib,
  ...
}: {
  home.sessionVariables = {
    #User vars
    EDITOR = "nvim";
    NIXOS_OZONE_WL = 1;
    #GTK & QT settings
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    WINEDLLOVERRIDES = "winemenubuilder.exe=d";
    #Sway
    # WLR_NO_HARDWARE_CURSORS = 1;
    # WLR_DRM_NO_ATOMIC = 0;
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
  };
  home.activation.copyFontsForOnlyOffice = let
    inherit (lib) concatMapStringsSep;
    fonts = with pkgs; [
      corefonts
      vista-fonts
      roboto
      wineWow64Packages.fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];
  in
    lib.hm.dag.entryAfter ["writeBoundary"] ''
      # 1. Сначала возвращаем права на запись, чтобы иметь возможность удалить старую папку
      if [ -d "$HOME/.local/share/fonts" ]; then
        chmod -R u+w "$HOME/.local/share/fonts"
      fi

      # 2. Очищаем и создаем директорию заново
      rm -rf "$HOME/.local/share/fonts"
      mkdir -p "$HOME/.local/share/fonts"

      # 3. Копируем шрифты
      font_regexp='.*\.\(ttf\|ttc\|otf\|pcf\|pfa\|pfb\|bdf\)\(\.gz\)?'
      ${concatMapStringsSep "\n" (
          x: "find ${x} -regex $font_regexp -exec cp '{}' ~/.local/share/fonts/ \\;"
        )
        fonts}

      # 4. Устанавливаем нормальные права доступа (755 для папок, 644 для файлов)
      chmod 755 "$HOME/.local/share/fonts"
      chmod 644 "$HOME/.local/share/fonts"/*
    '';
}
