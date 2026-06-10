{ config, osConfig, lib, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = lib.mkForce "FiraCode Nerd Font";
      size = 12;
    };
  };
}
