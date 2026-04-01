{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    hyprlauncher
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings.ecosystem = {
      enforce_permissions = true;
      permission = [
        "${lib.escapeRegex (lib.getExe pkgs.hyprshot)}, screencopy, allow"
        "${lib.escapeRegex "${pkgs.xdg-desktop-portal-hyprland}/libexec/.xdg-desktop-portal-hyprland-wrapped"}, screencopy, allow"
      ];
    };
  };
}
