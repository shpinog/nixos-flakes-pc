{ config, lib, pkgs, inputs, ... }: {

  home.activation.createMesaShaderCache =
    lib.hm.dag.entryAfter ["writeBoundary"] ''
     mkdir -p "$HOME/.mesa_shader_cache"
  '';

  home.sessionVariables = {
    MESA_SHADER_CACHE_DIR = "$HOME/.mesa_shader_cache";
  };
  
  dconf = {
    enable = true;
  };

  services = {
      kdeconnect = {
          enable = false;
          indicator = false;
        };
    };


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
    };

    alacritty = {
        enable = true;
        settings = {
            terminal.shell = {
                program = "fish";
              }; 
          };

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
