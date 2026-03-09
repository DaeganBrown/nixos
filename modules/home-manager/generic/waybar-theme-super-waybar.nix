{ pkgs, ... }:

{
  # config and style taken from super waybar by Anik200
  # https://github.com/Anik200/dotfiles/blob/super-waybar/.config/waybar/
  home.packages = [ pkgs.waybar ];
  progrmas.waybar = {
    enable = true;
  };
  settings.mainBar = {
    layer = "top";
    position = "top";
    mod = "docK";
    margin-left = 10;
    margin-right = 10;
    margin-top = 7;
    margin-bottom = 0;
    exclusive = "true";
    passthrough = "false";
    gtk-layer-shell = "true";
    reload_style_on_change = "true";

    modules-left = [
      "custom/smallspacer"
      "hyprland/workspaces"
      "custom/spacer"
      "mpris"
    ];
    modules-center = [
      "custom/padd"
      "custom/l_end"
      "custom/r_end"
      "hyprland/window"
      "custom/padd"
    ];
    modules-right = [
      "custom/padd"
      "custom/l_end"
      "group/expand"
      "network"
      "group/expand-3"
      "group/expand-2"
      "group/expand-4"
      "memory"
      "cpu"
      "clock"
      "custom/notification"
      "custom/padd"
    ];

    "custom/led" = {
      format = "<span color='#021c18'>󰍿</span> <span color='#313436'></span> ";
      format-alt = "󰍿 <span color='#bbc2c7'></span> ";
      # on-click = "~/mouse.sh";
      # see github for shell script
      tooltip = "false";
    };
    "upower" = {
      icon-size = 20;
      format = "";
      format-alt = "{}<span color='orange'>[{time}]</span>";
      tooltip = "true";
      tooltip-spacing = 20;
      on-click-right = "pkill waybar & hyprctl dispatch exec waybar";
    };
    "upower#headset" = {
      format = "󰋎 {percentage}";
      native-path = "/org/freedsektop/UPower/devices/headset_dev_A6_98_9A_0D_D3_49";
      show-icon = "false";
      tooltip = "false";
    };
    "group/expand-4" = {
      orientation = "horizontal";
      drawer = {
        transition-duration = 600;
        children-class = "not-power";
        transition-to-left = "true";
        click-to-reveal = "true";
      };
      modules = [ "upower" "upower/headset" ];
    };
    "custom/smallspacer" = {
      format = " ";
    };
    "memory" = {
      interval = 1;
      rotate = 270;
      format = "{icon}";
      format-icons = [
        "󰝦"
        "󰪞"
        "󰪟"
        "󰪠"
        "󰪡"
        "󰪢"
        "󰪣"
        "󰪤"
        "󰪥"
      ];
      max-length = 10;
    };
    "cpu" = {
      interval = 1;
      format = "{icon}";
      rotate = 270;
      format-icons = [ 
        "󰝦"
        "󰪞"
        "󰪟"
        "󰪠"
        "󰪡"
        "󰪢"
        "󰪣"
        "󰪤"
        "󰪥"
      ];
    };
    "mpris" = {
      format = "{player_icon} {dynamic}";
      format-paused = "<span color='grey'>{status_icon} {dynamic}</span>";
      max-length = 50;
      player-icons = {
        default = "⏸";
        mpv = "🎵";
      };
      status-icons = {
        paused = "▶";
      };
      # ignored-players = [ "firefox" ]

    };
    "tray" = {
      icon-size = 16;
      rotate = 0;
      spacing = 3;
    };
    "group/expand" = {
      orientation = "horizontal";
      drawer = {
        transition-duration = 600;
        children-class = "not-power";
        transition-to-left = "true";
        # click-to-reveal = "true";
      };
      modules = [
        "custom/menu"
        "custom/spacer"
        "tray"
      ];
    };
    "custom/menu" = {
      format = "󰅃";
      rotate = 90;
    };
    "custom/notification" = {
      tooltip = "false";
      format = "{icon}";
      format-icons = {
        notification = "󰅸";
        none = "󰂜";
        dnd-notification = "󰅸";
        dnd-none = "󱏨";
        inhibited-notification = "󰅸";
        inhibited-none = "󰂜";
        dnd-inhibited-notification = "󰅸";
        dnd-inhibited-none = "󱏨";
      };
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click-right = "swaync-client -d -sw";
      on-click = "swaync-client -t -sw";
      escape = "true";
    };
    "hyprland/window" = {
      format = "<span weight='bold' >{class}</span>";
      max-length = 120;
      icon = "false";
      icon-size = 13;
    };
    "custom/power" = {
      format = "@{}";
      rotate = 0;
      on-click = "ags -t ControlPanel";
      on-click-right = "pkill ags";
      tooltip = "true";
    };
    "custom/spacer" = {
      format = "|";
    };
    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        default = "";
        active = "";
      };
    };
    "wlr/workspaces" = {
      persistent-workspaces = {
        "3" = [];
        "4" = ["eDP-1"];
        "5" = ["eDP-1" "DP-2"];
      };
    };
    "cava" = {
    };
    "custom/script" = {
      on-click = "~/.config/waybar/volume.sh toggle";
      format = "";
    };
    "custom/cliphist" = {
      format = "{}";
      rotate = 0;
      exec = "echo ; echo 󰅇 clipboard history";
      on-click = "sleep 0.1 && cliphist.sh c";
      on-click-right = "sleep 0.1 && cliphist.sh d";
      on-click-middle = "sleep 0.1 && cliphist.sh w";
      interval = 86400;
      tooltip = "true";
    };
    "custom/wbar" = {
      format = "𐌏{}";
      rotate = 0;
      exec = "echo ; echo show app menu";
      on-click = "wofi --show drun";
      on-clic
    };
  };
}
