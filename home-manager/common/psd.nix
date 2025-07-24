{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  services.psd = {
    enable = false;
    resyncTimer = "15m";
  };

}
