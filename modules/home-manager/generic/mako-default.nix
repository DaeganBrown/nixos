{ pkgs, config, ...}:

{
  
  services.mako = {
    enable = true;
    settings = {
      border-radius = 0;
      border-size = 2;
    };
  };
  # home.packages = [
  #   pkgs.mako
  # ];
  # systemd.user.services.mako.Install.WantedBy = [ "graphical-session.target" ];
}
