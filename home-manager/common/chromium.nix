{ config, pkgs, inputs,lib, ... }: {

  programs.chromium = {
      enable = true;
      # package = pkgs.chromium;
      commandLineArgs = ["--ignore-gpu-blocklist" "--ozone-platform-hint=auto" ];
      extensions = [
         { id = "nngceckbapebfimnlniiiahkandclblb";}
         { id ="cjpalhdlnbpafiamejdnhcphjbkeiagm";}

      ];

      
    };
}
