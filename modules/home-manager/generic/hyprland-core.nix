{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprlauncher
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings.ecosystem = {
      enforce_permissions = 1; 
    };
  };
}
