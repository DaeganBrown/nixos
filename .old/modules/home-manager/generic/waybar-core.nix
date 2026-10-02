{ config, pkgs, ... }:

{
  home.packages = [ pkgs.waybar ];
  programs.waybar = {
    enable = true;
  };
}
