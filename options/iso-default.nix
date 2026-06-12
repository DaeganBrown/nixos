{ config, pkgs, lib, ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = [ 1920 1080 ];
    terminal = "kitty";
    theme = "tron";
    username = "user";
  };
}
