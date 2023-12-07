{ config, pkgs, ... }: {

environment.systemPackages = [
    (pkgs.writeShellScriptBin "wayland-session" ''
      /run/current-system/systemd/bin/systemctl --user reload-or-restart sway-session.target
      "$@"
      systemctl --user import-environment PATH

      ${pkgs.hyprland}/bin/Hyprland
    '')
];

services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
      command = "wayland-session";
      user = "shpinog";
    };
    default_session = initial_session;
  };
};
}
