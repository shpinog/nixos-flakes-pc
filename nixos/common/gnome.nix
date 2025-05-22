
{ pkgs, config, lib, ... }: {

services.gnome.core-os-services.enable = true;
services.gnome.gnome-user-share.enable = true;
services.gnome.core-utilities.enable = true;
environment.systemPackages = with pkgs; [
  glib  
];

}
