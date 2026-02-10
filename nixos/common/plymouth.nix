{ pkgs, config, lib, ... }: {

  boot = {

    plymouth = {
      enable = true;
    };

    # Enable "Silent boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=false"
      "vt.global_cursor_default=0"
      "boot.shell_on_fail"
      "loglevel=0"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"

    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;

    };
}
