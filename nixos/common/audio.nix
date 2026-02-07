{
  pkgs,
  config,
  lib,
  ...
}:
{

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # wireplumber.extraConfig = {
    #   "50-bluez" = {
    #     "monitor.bluez.rules" = [
    #       {
    #         matches = [ { "device.name" = "~bluez_card.*"; } ];
    #         actions = {
    #           update-props = {
    #             "bluez5.auto-connect" = [
    #               "a2dp_sink"
    #               "a2dp_source"
    #             ];
    #             "bluez5.hw-volume" = [
    #               "a2dp_sink"
    #               "a2dp_source"
    #             ];
    #           };
    #         };
    #       }
    #     ];
    #     "monitor.bluez.properties" = {
    #       "bluez5.roles" = [
    #         "a2dp_sink"
    #         "a2dp_source"
    #         "bap_sink"
    #         "bap_source"
    #       ];
    #
    #       "bluez5.codecs" = [
    #         "sbc"
    #         "ldac"
    #         "aptx"
    #         "aptx_ll_duplex"
    #         "aptx_ll"
    #         "aptx_hd"
    #         "opus_05_pro"
    #         "opus_05_71"
    #         "opus_05_51"
    #         "opus_05"
    #         "opus_05_duplex"
    #         "aac"
    #         "sbc_xq"
    #       ];
    #
    #     };
    #   };
    # };
  };

  programs.noisetorch.enable = true;

  services.pulseaudio = {
    enable = false;
    package = pkgs.pulseaudioFull;
  };
  environment.systemPackages = [
    pkgs.deepfilternet
    pkgs.easyeffects
  ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth = {
    settings = {
      General = {
        Enable = "Socket,Media,Sink,Source";
        # MultiProfile = "multiple";
        ControllerMode = "bredr";
        Disable= "Input";
        # FastConnectable = "true";
        # Experimental = true;
        # KernelExperimental = true;
      };
    };
  };
}
