{
  config,
  pkgs,
  system,
  ...
}:
{

  services.flatpak.enable = true;

  # services.ollama = {
  #     enable = true;
  #     acceleration = "rocm";
  #     openFirewall = true;
  #     environmentVariables = {
  #     ROCR_VISIBLE_DEVICES = "0, 1";
  #     HCC_AMDGPU_TARGET = "gfx1031"; # used to be necessary, but doesn't seem to anymore
  #     OLLAMA_FLASH_ATTENTION = "1";
  #     OLLAMA_KEEP_ALIVE = "-1";
  #   };
  #     rocmOverrideGfx = "10.3.1";
  #   };
  #
  # hardware.amdgpu.opencl.enable = true;

  # services.open-webui = {
  #   enable = true;
  #   openFirewall = true;
  #   host = "0.0.0.0";
  #  };

  programs.appimage = {
    enable = true;
    binfmt = true;

  };

  programs = {

    weylus = {
      enable = true;
      users = [ "shpinog" ];
      openFirewall = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    file-roller = {
      enable = true;
    };

    dconf = {
      enable = true;
    };

    droidcam = {
      enable = true;
    };

    adb = {
      enable = true;
    };

  };
}
