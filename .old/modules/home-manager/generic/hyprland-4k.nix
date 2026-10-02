{ config, pkgs, ...}:

{
  wayland.windowManager.hyprland.settings = { 
    monitor = [ 
      "HDMI-A-1, 3840x2160@60, 0x0, 2"
    ];
    xwayland = {
      force_zero_scaling = true;
    };
    env = [
      "GDK_SCALE,2"
      "XCURSOR_SIZE,32"
    ];
  };
}
