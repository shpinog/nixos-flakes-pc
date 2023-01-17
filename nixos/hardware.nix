{ pkgs, config, lib, ... }:{



  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;
  services.throttled.enable = true;
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
  };

#Mouse
services.ratbagd.enable = true;
### Video Drivers
programs.gamemode = {
  enable  = true;
  enableRenice = true;
};


### Media settings
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
