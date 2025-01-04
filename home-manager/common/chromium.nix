{ config, pkgs, inputs,lib, ... }: 

let
  vivaldi-custom = pkgs.writeShellScriptBin "vivaldi-custom" ''
    vivaldi \
   --enable-oop-rasterization \
   --enable-gpu-compositing \
   --disable-gpu-memory-buffer-video-frames \
   --process-per-site \
   --enable-accelerated-2d-canvas \
   --enable-zero-copy \
   --canvas-oop-rasterization \
   --enable-accelerated-video-decode \
   --enable-accelerated-video-encode \
   --enable-hardware-overlays \
   --ignore-gpu-blocklist \
   --enable-raw-draw \
   --enable-features=Vulkan,UseSkiaRenderer \
   --enable-features=CanvasOopRasterization,VaapiVideoDecoder,VaapiVideoEncoder,VaapiIgnoreDriverChecks,RawDraw \
   --disable-gpu-driver-bug-workarounds \
   --enable-features=UseOzonePlatform  \
   --ozone-platform=wayland \ 
  '';
in
{
  home.packages = with pkgs; [vivaldi-custom];

  programs.chromium = {
      enable = true;
      package = pkgs.vivaldi;
      extensions = [
         { id = "nngceckbapebfimnlniiiahkandclblb";}
         { id ="cjpalhdlnbpafiamejdnhcphjbkeiagm";}

      ];

    };
}

