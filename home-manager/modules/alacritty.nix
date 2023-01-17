{ config, pkgs, ... }: {

  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "fish";
      };
      env = {
        TERM = "xterm-256color";
        WINIT_X11_SCALE_FACTOR = "1.0";
      };
      window = {
        dynamic_padding = true;
      };
      font = {
        normal = {
          family = "JetBrains Mono";
        };
        size = 14;

      };
    };

  };

}
