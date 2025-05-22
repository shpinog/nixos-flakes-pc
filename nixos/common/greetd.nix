{ config, pkgs, inputs, ... }:

let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/Hyprland";
  sway= "${pkgs.sway}/bin/sway";
in
{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "wayland-session" ''
      exec ${sway}
    '')
  ];

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${tuigreet} --time --time-format '%a, %d %b %Y • %T' --greeting '[Become \n          Visible]' --asterisks --remember --cmd wayland-session";
        user = "greeter";
      };
    };
  };
}
