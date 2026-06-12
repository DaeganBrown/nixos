{ config, osConfig, lib, ... }:

{
  programs.kitty = {
    enable = true;
    # font = {
    #   name = "${osConfig.font.mono}";
    #   size = osConfig.font.size;
    # };
  };
}
