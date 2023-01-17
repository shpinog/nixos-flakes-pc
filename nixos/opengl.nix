{ pkgs, ... }:{

  services.xserver.videoDrivers = ["nvidia" "radeon"];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  hardware.nvidia.modesetting.enable = true;
  # hardware.nvidia.nvidiaPersistenced = true;
  # hardware.nvidia.powerManagement.enable = true;

  hardware.nvidia.prime = {
    offload.enable = true;
    sync.enable = false;

    # # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
    amdgpuBusId = "PCI:4:0:0";
    #
    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:3:0:0";
  };
}

