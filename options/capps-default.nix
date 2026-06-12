{ config, pkgs, lib, ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = [ 3840 2160 ];
    searchEngine = "vivaldi";
    taskbar = {
      position = "bottom";
      fontSize = 15;
    };
    terminal = "kitty";
    theme = "tron";
    wallpaper = "tron-red-bike.jpg";
    username = "capps";
  };
}
