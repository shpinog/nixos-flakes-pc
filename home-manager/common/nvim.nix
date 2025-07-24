{ config, lib, pkgs, inputs, ... }:{
  imports = [ inputs.LazyVim.homeManagerModules.default ];
  programs.neovim = {
        enable = true;
        vimAlias = true;
        vimdiffAlias = true;
        withNodeJs = true;
  };

  programs.lazyvim = {
    enable = true;
    extras = {
      lang = {
        nix.enable = true;
      };
    };
  };

}


