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
      modules-right = [
        "battery"
      ];
      "battery" = {
        format = "{capacity}%";
        format-alt = "{power}W";
        interval = 60;
        on-click = "waybar-msg module battery toggle";
      };


    };
  };
}
