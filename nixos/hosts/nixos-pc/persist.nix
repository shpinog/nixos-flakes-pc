{ config, pkgs, impermanence, ... }:
{

  # this folder is where the files will be stored (don't put it in tmpfs)
  environment.persistence."/nix/persist/system" = { 
    directories = [
      "/etc/nixos"    # bind mounted from /nix/persist/system/etc/nixos to /etc/nixos
      "/etc/NetworkManager"
      "/var/log"
      "/var/lib"
      "/etc/ssh"
    ];
    files = [
      "/etc/machine-id"
      "/etc/nix/id_rsa"
    ];
  };

}
