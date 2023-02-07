{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    shellAbbrs = {
        htop = "btm";
      };
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
