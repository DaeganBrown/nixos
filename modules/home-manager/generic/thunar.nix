{ ... }:

{
  gtk.gtk3.bookmarks = [
    "file:///home/you/downloads"
    "file:///home/you/nixos"
    "file:///home/you/pictures"
    "file:///home/you/projects"
  ];
  wayland.windowManager.hyprland.settings.windowrule = [
    "opacity 0.85 0.85, match:class thunar"
  ];
}
