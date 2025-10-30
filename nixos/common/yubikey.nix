{
  pkgs,
  config,
  lib,
  ...
}:
{

  # YubiKey
  environment.systemPackages = with pkgs; [
    yubikey-personalization # CLI tools for configuring YubiKey
    yubioath-flutter
    yubikey-agent
    libfido2 # Support for FIDO2/WebAuthn
    opensc # Smart card support
    gnupg # If using GPG with YubiKey
    pcsclite
  ];

  hardware.gpgSmartcards.enable = true;

  services = {
    udev.packages = with pkgs; [ yubikey-personalization ];
    pcscd.enable = true;
    yubikey-agent.enable = true;

  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

}
