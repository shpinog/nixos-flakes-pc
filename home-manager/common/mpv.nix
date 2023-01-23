{ config, pkgs, ... }: {
  programs.mpv = {
    enable = true;
    config =
      {
        keepaspect = "yes";
        deband = "no";
        #      force-window = true;
        cache = "yes";
        cache-pause-initial = "yes";
        cache-pause-wait = "10";
        interpolation = "yes";
        video-sync = "display-resample";
        tscale = "oversample";
        hwdec-codecs = "all";
        audio-channels = "stereo";
        #      gpu-context = "x11vk";
      };
  };
}
