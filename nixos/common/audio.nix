{ pkgs, config, lib, ... }:{
    
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.noisetorch.enable = true;

  sound.enable = true;
  hardware.pulseaudio.daemon.config = {
    avoid-resampling = "yes";
    resample-method = "soxr-vhq";
    default-sample-rate = "48000";
    default-sample-format = "s32le";
  };

  hardware.pulseaudio = {
    enable = false;
    package = pkgs.pulseaudioFull;
  };


  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth.settings = {

    General = {
      # MultiProfile = "multiple";
      # ControllerMode = "bredr";
      FastConnectable = "true";

    };
  };
  }
