{ config, pkgs, inputs, lib, ... }: 

let
  vivaldi-custom = pkgs.writeShellScriptBin "vivaldi-custom" ''
vivaldi \
      --enable-gpu-compositing \
      --enable-accelerated-2d-canvas \
      --enable-zero-copy \
      --enable-accelerated-video-decode \
      --enable-accelerated-video-encode \
      --ignore-gpu-blocklist \
      --enable-features=VaapiVideoDecoder,VaapiVideoEncoder,VaapiIgnoreDriverChecks,UseOzonePlatform,BackForwardCache \
      --ozone-platform=wayland \
      --enable-native-gpu-memory-buffers \
      --enable-gpu-rasterization \
      --force-gpu-rasterization \
      --enable-raw-draw \
      --disable-gpu-driver-bug-workarounds \
      --disable-features=UseChromeOSDirectVideoDecoder \
      --enable-webgl \
      --enable-webgl2-compute-context \
      --enable-vulkan \
      --enable-zero-copy-dxgi-video \
      --process-per-site \
      --enable-parallel-downloading \
      --disk-cache-size=104857600 \
    "$@"
  '';
in
{
  home.packages = with pkgs; [
    vivaldi-custom
  ];

  programs.chromium = {
    enable = true;
    package = pkgs.vivaldi;
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
    ];
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
      "--enable-hardware-overlays"
    ];
  };

  # Дополнительные настройки окружения
  home.sessionVariables = {
    ENABLE_WEBGL = "1";
    ENABLE_ACCELERATED_VIDEO_DECODE = "1";
  };
}
