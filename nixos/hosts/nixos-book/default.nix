{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./kernel.nix
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

  networking.hostName = "nixos-book";

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

  users.users = {
    shpinog = {
      initialPassword = "123";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
    extraGroups = [ "wheel" "networkmanager"  "storage" "media"  "lp"  "video" ];
    };
  };


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
