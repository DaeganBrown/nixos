{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings.ecosystem = {
      enforce_permissions = 1; 
    };
  };
}
