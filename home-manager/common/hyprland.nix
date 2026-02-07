{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];
  programs.dankMaterialShell.enable = true;

  xdg.configFile."hypr/config" = {
    recursive = false;
    source = "${./dotfiles/default/hypr}";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    extraConfig = ''
      source=~/.config/hypr/config/default.cfg
    '';
  };

  home.packages = with pkgs; [
    wl-clipboard
    hyprshot
    hypridle
    clipse
  ];

}
