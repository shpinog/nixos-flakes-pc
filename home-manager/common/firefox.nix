{ config, pkgs, inputs, lib, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles = {
      shpinog = {
        isDefault = true;
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          ublock-origin
          violentmonkey
          translate-web-pages
          languagetool
        ];
        settings = {
          "browser.startup.homepage" = "https://nixos.org";
          "browser.search.region" = "RU";
          "browser.search.isUS" = false;
          "distribution.searchplugins.defaultLocale" = "ru-RU";
          "general.useragent.locale" = "ru-RU";
        };
      };
    };
  };
}
