{ config, pkgs,inputs, ... }: {


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

    bottom = {
        enable = true;
        settings = {
            flags = {
                basic = true;
                tree = true;
                mem_as_value = false;
              };
          };
      };


  };
}
