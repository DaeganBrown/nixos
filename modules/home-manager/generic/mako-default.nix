{ pkgs, config, ...}:

{
  
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    settings = {
      border-radius = 0;
      border-size = 2;
    };
    extraConfig = ''
      max-timeout=10000
    '';
  };
  # home.packages = [
  #   pkgs.mako
  # ];
  # systemd.user.services.mako.Install.WantedBy = [ "graphical-session.target" ];
}
