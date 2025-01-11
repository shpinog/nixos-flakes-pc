{ config, pkgs, inputs, lib, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-esr;
    profiles = {
      shpinog = {
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
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
          "browser.bookmarks.showMobileBookmarks" = true;
        };

        bookmarks = {
          NixSearch = {
            keyword = "nix";
            url = "https://search.nixos.org";
          };
          "Home-manager options" = {
            url = "https://rycee.gitlab.io/home-manager/options.html";
            keyword = "home";
          };
        };
      };
    };
  };
}