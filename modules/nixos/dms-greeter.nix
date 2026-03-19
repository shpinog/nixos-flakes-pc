{
  pkgs,
  config,
  lib,
  ...
}: let
  inputs = config._module.args.inputs;
in {
  systemd.services.greetd.serviceConfig = {
    ExecStartPre = "-${pkgs.procps}/bin/pkill -KILL niri";
    KillSignal = "SIGKILL";
    KillMode = "control-group";
  };

  programs.niri = {
    enable = true;
    # package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-stable;
    package = pkgs.niri;
  };

  programs.dank-material-shell.greeter = {
    enable = true;

    compositor = {
      name = "niri";
      customConfig = ''

        cursor {
          xcursor-theme "Adwaita"
          xcursor-size 24
        }
        spawn-at-startup "dbus-update-activation-environment" "--all"
      '';
    };

    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };

    quickshell.package = pkgs.quickshell;
  };
}
