{ config, pkgs, ... }: {

  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "foot";
        login-shell = "yes";
        shell = "${pkgs.fish}/bin/fish";
        font = "DroidSansMono Nerd Font:size=14";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

   systemd.user.services.foot.Install.WantedBy = ["sway-session.target"]; 
   systemd.user.services.foot.Service.ExecStartPre = ["-/bin/sleep 10"]; 

}
