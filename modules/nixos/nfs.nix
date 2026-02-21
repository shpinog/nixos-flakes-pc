
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
services.samba.settings = {
  global = {
    interfaces = "lo 192.168.4.0/24";
    "bind interfaces only" = "yes";
    workgroup = "WORKGROUP";
    "server string" = "NixOS Samba Server";
    "netbios name" = "nixos-pc";
    security = "user";
    "map to guest" = "never";
  };

  files = {
    path = "/home/shpinog/Files";
    "read only" = "no";
    "guest ok" = "no";
    "valid users" = "shpinog";
    "force create mode" = "0660";
    "force directory mode" = "0770";
  };
};
}
