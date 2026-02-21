{ config, pkgs, lib, ... }:

let
  browser = [ "librewolf.desktop" ];
  mpv = [ "mpv.desktop" ];
  eog = [ "org.gnome.eog.desktop" ];
  fileRoller = [ "org.gnome.FileRoller.desktop" ];
  writer = [ "libreoffice-writer.desktop" ];

  videoFormats = [
    "video/x-matroska" "video/mp4" "video/webm" "video/quicktime"
    "video/x-msvideo" "video/x-flv" "video/x-ms-wmv" "video/mpeg"
    "video/x-m4v" "video/3gpp" "video/x-matroska-3d"
  ];

  audioFormats = [
    "audio/ogg" "audio/mpeg" "audio/x-wav" "audio/x-flac"
    "audio/x-vorbis+ogg" "audio/x-opus+ogg"
  ];

  imageFormats = [
    "image/jpeg" "image/png" "image/svg+xml" "image/webp"
  ];

  archiveFormats = [
    "application/zip" "application/x-tar" "application/x-xz"
    "application/x-7z-compressed" "application/x-rar"
  ];

  officeFormats = [
    "application/json"
    "text/plain"
    "text/x-markdown"
    "text/x-yaml"
    "application/pdf"
  ];
in
{
  xdg.mimeApps = {
    enable = true;

    defaultApplications =
      (lib.genAttrs videoFormats (_: mpv))
      // (lib.genAttrs audioFormats (_: mpv))
      // (lib.genAttrs imageFormats (_: eog))
      // (lib.genAttrs archiveFormats (_: fileRoller))
      // (lib.genAttrs officeFormats (_: writer))
      // {
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "text/html" = browser;
      };
  };
}