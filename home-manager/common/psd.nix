{ config, lib, pkgs, inputs, ... }: {
services.psd = {
    enable = true;
    resyncTimer = "15m";
  };

}
