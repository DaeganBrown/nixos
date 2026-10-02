{ pkgs, config, ...}:

{
  
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      border-radius = 0;
      border-size = 2;
    };
    # extraConfig = ''
    #   max-timeout=10000
    # '';
  };
  home.packages = [
    pkgs.libnotify
  ];
  # systemd.user.services.mako.Install.WantedBy = [ "graphical-session.target" ];
}
