{ pkgs, config, ...}:

{
  
  services.mako = {
    enable = true;
    settings = {
      backgroundColor = "#${config.colorScheme.palette.base0E}";
      borderColor = config.colorScheme.palette.base0E;
      borderRadius = 5;
      borderSize = 2;
      textColor = config.colorScheme.palette.base0E;
      layer = "overlay";
    };
  };
}
