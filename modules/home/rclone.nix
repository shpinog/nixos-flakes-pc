{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  systemd.user.services.rclone-gdrive = {
    Unit = {
      Description = "On-demand Google Drive Mount (rclone)";
      After = ["network-online.target"];
    };

    Service = {
      Type = "simple";
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/GoogleDrive";
      ExecStart = "${pkgs.rclone}/bin/rclone mount Gdrive: %h/GoogleDrive --vfs-cache-mode full --dir-cache-time 72h --attr-timeout 1h --vfs-cache-max-age 24h --vfs-read-chunk-size 32M --buffer-size 64M --vfs-cache-max-size 10G";
      ExecStop = "/run/wrappers/bin/fusermount -u %h/GoogleDrive";
    };
  };
}
