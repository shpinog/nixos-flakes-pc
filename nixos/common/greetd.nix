{ config, pkgs, inputs, ... }: 
let
tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
in
 
{

environment.systemPackages = [
    (pkgs.writeShellScriptBin "wayland-session" ''
      /run/current-system/systemd/bin/systemctl --user reload-or-restart sway-session.target
      "$@"
      systemctl --user import-environment PATH

      ${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/Hyprland

    '')
];

services.greetd = {
  enable = true;
  settings = {
    default_session = {
      command = "${tuigreet} --time --time-format '%a, %d %b %Y • %T' --greeting  '[Become \n          Visible]' --asterisks --remember --cmd wayland-session";
      user = "greeter";
      };

  };
};
}
