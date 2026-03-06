{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprshot
    hyprlauncher
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings.ecosystem = {
      enforce_permissions = 1; 
    };
  };
}
