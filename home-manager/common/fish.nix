{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    
    shellAbbrs = {
    };
    
    shellAliases = {
        dff = "duf";
        duu = "dust -Hr";
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
