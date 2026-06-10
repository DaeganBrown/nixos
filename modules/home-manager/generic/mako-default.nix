{ pkgs, config, ...}:

{
  
  services.mako = {
    enable = true;
    # settings = {
    #   background-color = "#${config.colorScheme.palette.base0E}";
    #   border-color = "#${config.colorScheme.colors.base0E}";
    #   border-radius = 5;
    #   border-size = 2;
    #   text-color = "#${config.colorScheme.colors.base0E}";
    #   layer = "overlay";
    # };
  };
  home.packages = [
    pkgs.mako
  ];
  # systemd.user.services.mako.Install.WantedBy = [ "graphical-session.target" ];
}
