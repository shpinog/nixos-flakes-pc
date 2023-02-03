{ config, pkgs, inputs,lib, ... }: 

  let
    addons = inputs.firefox-addons.packages.${pkgs.system};

  in  

{

  nixpkgs.overlays = with inputs; [nur.overlay];
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-esr;
    extensions = with pkgs.nur.repos.rycee.firefox-addons;[
      # https-everywhere
      bitwarden
      ublock-origin
      violentmonkey
      translate-web-pages
      languagetool
    ];
    profiles = {
      shpinog = {
        isDefault = true;
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
