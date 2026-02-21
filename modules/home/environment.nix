{ config, pkgs, ... }:
{
  home.sessionVariables = {
    #User vars
    EDITOR = "nvim";
    NIXOS_OZONE_WL = 1;
    #GTK & QT settings
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_TYPE = "wayland";
    # _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    #Sway
    # WLR_NO_HARDWARE_CURSORS = 1;
    # WLR_DRM_NO_ATOMIC = 0;
    WLR_RENDERER = "gles2";
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    # WLR_DRM_NO_MODIFIERS = 1;
    # WLR_DRM_DEVICES = "/dev/dri/card0";

    #Nvidia X11

    #nvidia wayland
    # VK_LOADER_DRIVERS_SELECT="nvidia*";
    # VK_ICD_FILENAMES="/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";
    # __GL_THREADED_OPTIMIZATION = "1";
    # GBM_BACKEND = "nvidia-drm";
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # __GLX_VENDOR_LIBRARY_NAME = "mesa";
    # __VK_LAYER_NV_optimus = "NVIDIA_only";
    # vblank_mode = "0";
    # __GL_SYNC_TO_VBLANK = "0";
    # LIBVA_DRIVER_NAME = "vdpau";
    # VDPAU_DRIVER="radeonsi";
    # LIBVA_DRIVER_NAME="radeonsi";

  };

}
