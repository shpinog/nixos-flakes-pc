{ config, pkgs, ... }: {
  home.sessionVariables = {
    #User vars
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1"; 
    #GTK & QT settings
    # _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    #Sway
    # WLR_NO_HARDWARE_CURSORS = 1;
    # WLR_DRM_NO_MODIFIERS = 1;
    # WLR_DRM_DEVICES = "/dev/dri/card0";

    __GL_THREADED_OPTIMIZATION = "1";
    # vblank_mode = "0";

  };

}
