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
        WakeServ = "wakeonlan -i  192.168.4.255 6c:0b:84:ff:82:fd";
        vim = "nvim";
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
