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
        "cpu"
        "memory"
        "pulseaudio/slider"
        "pulseaudio"
        "network"
        "clock#date"
        "battery"
      ];
      "clock" = {
        format = "{:%H:%M }";
        interval = 60;
      };
      "cpu" = {
        format = "{usage}%";
        interval = 15;
      };
      "memory" = {
        format = "{used:0.1f}GiB/{total:0.1f}GiB";
        interval = 15;
        tooltip-format = "{swap:0.1f}GiB Swap";
      };
      "pulseaudio" = {
        format = "{volume}%";
        format-bluetooth = "󰥰 {volume}%";
        format-muted = " ";
      };
      "network" = {
        format = "{ifname}";
        format-alt = "{bandwidthTotalBits}";
        on-click = "waybar-msg module network toggle";
        tooltip-format = "{ipaddr}";
        interval = 15;
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
