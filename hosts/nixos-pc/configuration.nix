{ inputs, lib, config, pkgs,... }:

{
  imports = [
   ./kernel.nix
   ./programs.nix
   ./kde.nix
    
   ../../modules/nixos/hardware.nix
   ../../modules/nixos/nfs.nix
   ../../modules/nixos/stylix.nix
   ../../modules/nixos/network.nix
   ../../modules/nixos/steam.nix
   ../../modules/nixos/fonts.nix
   ../../modules/nixos/default.nix
   ../../modules/nixos/polkit.nix
   ../../modules/nixos/audio.nix
   ../../modules/nixos/yubikey.nix
   ../../modules/nixos/dms-greeter.nix
   ../../modules/nixos/services.sunshine.nix
   ../../modules/nixos/plymouth.nix
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/shpinog/nixos-flakes-pc/";
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];

  environment.variables = {
    FLAKE = "/home/shpinog/nixos-flakes-pc";
  };

  networking.hostName = "nixos-pc";

  nix.settings = {
    trusted-users = [ "shpinog" "root" ];
    system-features = [ "big-parallel" "gccarch-x86-64-v4" ];
    experimental-features = [ "nix-command flakes" ];
    auto-optimise-store = true;
    cores = 24;
    max-jobs = 1;
  };

  users.groups.i2c = { };
  users.users.shpinog = {
    isNormalUser = true;
    extraGroups = [
      "wheel" "networkmanager" "storage" "media" "lp" 
      "video" "input" "i2c" "vboxusers" "podman"
    ];
    hashedPassword = "$6$nBo/qjuyUFF2nzWL$MdmWyGhfbardBXoI9mT2p/kSvHCCCbdhD/kgt/VW/vTV.t9k5Lq04hPpg7jKQ5aEMzDHGDtXh.9uSBvvHQOcC0";
  };

  system.stateVersion = "22.11";
}