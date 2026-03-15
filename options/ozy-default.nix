{ config, pkgs, lib, ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = [ 1920 1080 ];
    searchEngine = "vivaldi";
    taskbar = {
      position = "top";
      marginSide = 10;
      marginTop = 7;
      fontSize = 15;
    };
    terminal = "kitty";
    theme = "gruvbox";
    username = "ozy";
  };
}
