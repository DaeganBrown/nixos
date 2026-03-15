{ config, pkgs, lib, ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = [ 1920 1080 ];
    searchEngine = "vivaldi";
    taskbar = {
      position = "bottom";
      marginSide = 10;
      marginTop = 7;
      fontSize = 30
    };
    terminal = "kitty";
    theme = "gruvbox";
    username = "spysi";
  };
}
