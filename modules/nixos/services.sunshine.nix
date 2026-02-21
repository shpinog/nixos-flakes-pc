{ config, lib, pkgs, ... }:{
  services.sunshine = {
    enable = true;
    capSysAdmin = true;


  };
}

# Enable using:
# services.sunshine.enable = true;
# Get Service Status
# systemctl --user status sunshine
# get logs
# journalctl --user -u sunshine --since "2 minutes ago"
