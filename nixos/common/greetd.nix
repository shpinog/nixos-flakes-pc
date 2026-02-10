{
  config,
  pkgs,
  inputs,
  ...
}:

let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  niri = "${pkgs.niri}/bin/niri-session";
  # hyprland = "${pkgs.hyprland}/bin/start-hyprland";
  # sway= "${pkgs.sway}/bin/sway";
in
{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "wayland-session" ''
      exec ${niri}
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
