{ config, pkgs, lib, ... }:

{
  imports = [ ./options.nix ];

  config = {
    hostname = "browncrashpad";
    resolution = [ 1920 1080 ];
    search_engine = "vivaldi";
    terminal = "kitty";
    theme = "tron";
    username = "admin";
  };
}
