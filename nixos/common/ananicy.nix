{ pkgs, config, lib, ... }:{
  systemd.enableCgroupAccounting = true;
  services.ananicy ={
    enable = true;
    package = pkgs.ananicy-cpp;
    settings = {
      apply_nice = true;
      apply_ioclass = true;
      apply_ionice = true;
      apply_sched = true;
      apply_oom_score_adj = true;
      apply_cgroup = true;
    };
    extraTypes = [
    {name = "gamescope"; nice = -20;}
    {name = "Hyprland"; nice = -20;}
    ];
  };
}
