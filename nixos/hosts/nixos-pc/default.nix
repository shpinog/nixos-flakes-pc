{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./kernel.nix
    ./programs.nix
    ../../common/hardware.nix
    ../../common/stylix.nix
    ../../common/network.nix
    ../../common/steam.nix
    ../../common/fonts.nix
    ../../common/default.nix
    ../../common/polkit.nix
    ../../common/greetd.nix
    ../../common/audio.nix
    ../../common/filesystem.nix

     ../../common/services.sunshine.nix

  ];

  nix = {
    settings = {
      trusted-users = [ "shpinog" "root" ];
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      cores = 24;
      max-jobs = 1;
    };
  };

 
  users.groups.i2c = {};
  users.users= {
  shpinog = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "media" "lp"  "video" "input" "i2c" ];
    hashedPassword = "$6$nBo/qjuyUFF2nzWL$MdmWyGhfbardBXoI9mT2p/kSvHCCCbdhD/kgt/VW/vTV.t9k5Lq04hPpg7jKQ5aEMzDHGDtXh.9uSBvvHQOcC0";

    # initialPassword = "123";
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}

