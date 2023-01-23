{ inputs, lib, config, pkgs, ... }: {

  # Boot and modules
  nix.settings.cores = 12;
  nix.settings.max-jobs = 12;

  imports = [
    ./hardware-configuration.nix
    ./kernel.nix
    ./nvidia.nix
    ./programs.nix
    ../../common/hardware.nix
    ../../common/network.nix
    ../../common/steam.nix
    ../../common/fonts.nix
    ../../common/default.nix
    ../../common/polkit.nix
    ../../common/greetd.nix
    ../../common/audio.nix
  ];

  networking.hostName = "nixos-pc";

  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  networking.hostName = "nixos-pc";

  users.users= {
  shpinog = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "media" "lp"  "video" ];
    initialPassword = "123";
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
