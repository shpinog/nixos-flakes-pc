{
  pkgs,
  config,
  lib,
  ...
}: {
  services.gvfs.enable = true; # Для Корзины, монтирования MTP (Android) и сетевых дисков
  services.tumbler.enable = true; # Для генерации миниатюр
  services.elephant.enable = true;
}
