{ config, pkgs, lib, ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = [ 3840 2160 ];
    searchEngine = "vivaldi";
    taskbar = {
      position = "bottom";
      fontSize = 30;
    };
    terminal = "kitty";
    theme = "gruvbox";
    wallpaper = "tron-blue-bike.jpg";
    username = "capps";
  };
}
