
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  services.samba = {
  enable = true;
  openFirewall = true;

  # Используем новую, структурированную опцию settings
  settings = {
    # Секция [global] в smb.conf
    global = {
      # Эти две строки заменяют собой extraConfig
      interfaces = "lo 192.168.4.0/24";
      "bind interfaces only" = "yes";

      # Дополнительные полезные настройки
      "workgroup" = "WORKGROUP";
      "server string" = "NixOS Samba Server";
      "netbios name" = "nixos-pc"; # Можете изменить на имя вашего сервера
      "security" = "user";
      "map to guest" = "never";
    };
  };

  # Раздел shares остается без изменений
  shares = {
    "files" = {
      path = "/home/shpinog/Files";
      "read only" = "no";
      guest_ok = "no";
      "valid users" = "shpinog";
      "force create mode" = "0660";
      "force directory mode" = "0770";
    };
  };
};
}
