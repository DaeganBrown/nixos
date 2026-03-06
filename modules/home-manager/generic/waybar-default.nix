{ config, pkgs, ... }:

{
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      output = [
        "eDP-1"
        "HDMI-A-1"
      ];

      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "clock#date"
        "battery"
      ];
      "clock" = {
        format = "{:%H:%M }";
        interval = 60;
      };
      "battery" = {
        format = "{capacity}%";
        interval = 60;
      };
      "clock#date" = {
        format = "{:%m-%d-%y }";
        format-alt = "{:%A %B %d}";
        interval = 60;
        on-click = "waybar-msg module clock toggle";
        tooltip-format = "<tt><small>{calendar}</small></tt>";
      };


    };
  };
}
