{ pkgs, config, lib, ... }: {

services.gvfs.enable = true; # Mount, trash, and other functionalities
services.tumbler.enable = true; # Thumbnail support for images


}
