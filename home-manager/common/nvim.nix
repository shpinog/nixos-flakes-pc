{ config, lib, pkgs, ... }: {

  programs = {
    neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
      withNodeJs = true;
      # extraConfig = ''
      #   lua require('.')
      # '';
    };
  };
  home.packages = with pkgs; [
    gcc 
    rnix-lsp
    rustup
  ];
}
