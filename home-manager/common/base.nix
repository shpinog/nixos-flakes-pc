{ config, pkgs,inputs, ... }: {

  nixpkgs.config.permittedInsecurePackages = [
              ];

  programs = {

    bat = {
      enable = true;
      config = { paging = "never"; };
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };


    lsd = {
      enable = true;
      enableAliases = true;
    };

    alacritty = {
        enable = true;
        settings = {
            terminal.shell = {
                program = "fish";
              }; 
          };

      };

    thunderbird = {
      enable = true;
      profiles.shpinog.isDefault = true;
    };

    bottom = {
        enable = true;
        settings = {
            flags = {
                basic = true;
                tree = true;
                mem_as_value = true;
              };
          };
      };


  };
}
