{
  inputs,
  config,
  pkgs,
  ...
}: {
  services.flatpak = {
    enable = true;

    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    packages = [
      "org.onlyoffice.desktopeditors"
      "eu.betterbird.Betterbird"
    ];

    overrides = {
      "org.onlyoffice.desktopeditors" = {
        Context = {
          filesystems = [
            "~/.icons:ro"
            "/run/current-system/sw/share/icons:ro"
          ];
        };
        Environment = {
          XCURSOR_THEME = "Quintom_Ink";
          XCURSOR_SIZE = "24"; # Значения переменных окружения во Flatpak должны быть строками
        };
      };
    };

    update.onActivation = true;
    uninstallUnmanaged = true;
  };
}
