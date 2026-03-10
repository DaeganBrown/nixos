{ config, pkgs, lib, ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = [ 1920 1080 ];
    search_engine = "vivaldi";
    terminal = "kitty";
    theme = "gruvbox";
    username = "spysi";
  };
}
