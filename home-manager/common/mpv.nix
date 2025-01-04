{ config, pkgs, ... }: {
  programs.mpv = {
    enable = true;
    scripts = [
    pkgs.mpvScripts.webtorrent-mpv-hook
    ];
    bindings = {
      "ctrl+r" = ''cycle_values video-rotate "90" "180" "270" "0" '';
    };
    config =
      {
        # keepaspect = "yes";
        # deband = "no";
        #      force-window = true;
        # cache = "yes";
        # cache-pause-initial = "yes";
        # cache-pause-wait = "10";
        # interpolation = "yes";
        # hwdec = "auto-safe";
        # vo = "gpu";
        # gpu-context = "wayland";
        # hwdec-codecs = "all";
        # audio-channels = "stereo";
        #      gpu-context = "x11vk";
      };
  };
}
