{ config, pkgs, lib, ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = [ 3840 2160 ];
    search_engine = "vivaldi";
    taskbar = {
      position = "bottom";
      fontSize = 30;
    };
    terminal = "kitty";
    theme = "gruvbox";
    username = "capps";
  };
}
