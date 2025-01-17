{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    #./persist.nix
    ./kernel.nix
    # ./nvidia.nix
    ./programs.nix
    ../../common/hardware.nix
    ../../common/network.nix
    ../../common/steam.nix
    ../../common/fonts.nix
    ../../common/default.nix
    ../../common/polkit.nix
    ../../common/greetd.nix
    ../../common/audio.nix
    ../../common/filesystem.nix
    ../../common/hyperland.nix
    # ../../common/ananicy.nix
     ../../common/services.sunshine.nix

  ];




  nixpkgs = {overlays = []; config = {allowUnfree = true; }; };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      cores = 12;
      max-jobs = 12;

      substituters = ["https://hyprland.cachix.org" "https://ai.cachix.org" ];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="  "ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="];
    };
  };

  # networking.hostName = "nixos-pc";
 
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

