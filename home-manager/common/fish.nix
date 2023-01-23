{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    plugins = [
    ]; 
    functions = {
      fish_greeting =""; 
    };
  };
      
  home.packages = with pkgs; [
    fasd
  ];
}
