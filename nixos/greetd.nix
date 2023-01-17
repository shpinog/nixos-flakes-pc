{ config, pkgs, ... }: {
services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
      command = "${pkgs.sway}/bin/sway --unsupported-gpu";
      user = "shpinog";
    };
    default_session = initial_session;
  };
};
}
