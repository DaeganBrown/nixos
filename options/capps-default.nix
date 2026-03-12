{ config, pkgs, lib, ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = [ 3840 2160 ];
    search_engine = "vivaldi";
    terminal = "kitty";
    theme = "gruvbox";
    username = "capps";
  };
}
