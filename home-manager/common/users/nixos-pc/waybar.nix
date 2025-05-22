{ inputs, config, pkgs, ... }: 
# let
#   unstable = import inputs.unstable {
#     system = pkgs.system;
#     # Uncomment this if you need an unfree package from unstable.
#     #config.allowUnfree = true;
#   };
# in
{
  programs.waybar = {
    enable = true;
  };

  #waybar configuration files
  xdg.configFile."waybar" = {
    recursive = false;
    source = "${../../dotfiles/nixos-pc/waybar}";
  };


}
