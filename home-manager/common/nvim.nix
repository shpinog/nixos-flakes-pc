{
  inputs,
  pkgs,
  config,
  lib,
  stylix,
  ...
}:
{


  home.packages = [
    (inputs.lazy-nvim-nix.packages.x86_64-linux.LazyVim.override {
    })
  ];

  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   vimAlias = true;
  # };
}
