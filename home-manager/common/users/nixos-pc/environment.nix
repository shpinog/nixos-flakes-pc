{ config, pkgs, ... }: {
  home.sessionVariables = {
    #User vars
    EDITOR = "nvim";
    #GTK & QT settings
    # GTK_THEME = "Yaru:dark";
    # MOZ_ENABLE_WAYLAND = 1;
    # XDG_CURRENT_DESKTOP = "sway";
    # XDG_SESSION_TYPE = "wayland";
    # _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    MOZ_DISABLE_RDD_SANDBOX = "1";
    #Sway
    # WLR_NO_HARDWARE_CURSORS = 1;
    # WLR_DRM_NO_MODIFIERS = 1;
    # WLR_DRM_DEVICES = "/dev/dri/card0";
    #Nvidia X11

    #nvidia wayland
    # __GL_THREADED_OPTIMIZATION = "1";
    # GBM_BACKEND = "nvidia-drm";
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    #  __GLX_VENDOR_LIBRARY_NAME = "mesa";
    # __VK_LAYER_NV_optimus = "NVIDIA_only";
    # vblank_mode = "0";
    # __GL_SYNC_TO_VBLANK = "0";
    # LIBVA_DRIVER_NAME = "vdpau";

  };

}
