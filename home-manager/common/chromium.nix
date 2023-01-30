{ config, pkgs, inputs,lib, ... }: {

  programs.chromium = {
      enable = true;
      # package = pkgs.chromium;
      commandLineArgs = ["--ignore-gpu-blocklist" ];
      extensions = [
         { id = "nngceckbapebfimnlniiiahkandclblb";}
         { id ="cjpalhdlnbpafiamejdnhcphjbkeiagm";}

      ];

      
    };
}
