{ pkgs, ... }:

{

  # This config is from the Arch install kit by Zilero232
  # https://github.com/Zilero232/arch-install-kit/tree/master/dotfiles/.config/waybar
  imports = [ ./waybar-core.nix ];
  
  programs.waybar = {
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 40;
      output = [
        "HDMI-A-1"
        "eDP-1"
      ];
      # Layout
      modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
        "custom/weather"
        "custom/updates"
        "custom/cava"
      ];
      modules-center = [
        "memory"
        "cpu"
        "temperature"
      ];
      modules-right = [
        "idle_inhibitors"
        "battery"
        "hyprland/language"
        "keyboard-state"
        "backlight"
        "pulseaudio"
        "network"
        "custom/vpn"
        "clock"
        "custom/modification"
        "tray"
      ];

      # Module Settings
      "custom/launcher" = {
        format = " ";
        # on-click = "rofi -show drun";
        on-click = "hyprlauncher";
        tooltop = "false";
      };
      "hyprland/workspaces" = {
        # on-scroll-up = "hyprctl dispatch workspace r-1";
        # on-scroll-down = "hyprctl dispatch workspace r+1";
        on-click = "activate";
        active-only = "false";
        all-outputs = "true";
        format = "{}";
        format-icons = {
          urgent = "";
          active = "";
          default = "";
        };
        persistent-workspaces = {
          "*" = 5;
        };
      };
      "custom/weather" = {
        # see link for weather script
      };
      "custom/updates" = {
        # see link for updates script
      };
      "custom/cava" = {
        # see link for cava script
      };
      "memory" = {
        format = " {: >3}%";
        # on-click = "neohtop";
      };
      "cpu" = {
        format = "󰘚 {usage: >3}%";
        # on-click = "neohtop";
      };
      "temperature" = {
        hwmon-path = "/sys/class/hwmon/hwmon1/temp1_input";
        critical-threshold = 80;
        format = "󰘚 {temperatureC}°C";
        # on-click = "neohtop";
      };
      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
          activated = "󰌾";
          deactivated = "󰌵";
        };
        tooltip-format-activated = "Idle inhibitor: ON";
        tooltip-format-deactivated = "Idle inhibitor: OFF";
      };
      "battery" = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity: >3}%";
        format-icons = [ "" "" "" "" "" ];
      };
      "hyprland/language" = {
        format = "󰌌 {short}";
        tootltip-format = "󰌌 {short}";
      };
      "keyboard-state" = {
        capslock = "true";
        format = "{name} {icon} ";
        format-icons = {
          locked = " ";
          unlocked = " ";
        };
      };
      "backlight" = {
        format = "{icon} {percent: >3}%";
        format-icons = [ "" "" ];
        on-scroll-down = "brightnessctl set 5%-";
        on-scroll-up = "brightnessctl set 5%+";
      };
      "pulseaudio" = {
        scroll-step = 1;
        format = "{icon} {volume: >3}%";
        format-bluetooth = "{icon} {volume: >3%}";
        format-muted = " muted";
        format-icons = {
          headphones = "";
          handsfree = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" ];
        };
        on-click = "pavucontrol";
        on-scroll-up = "pamixer -ui 2 && pamixer --get-volume > $SWAYSOCK.wob";
        on-scroll-down = "pamixer -ud 2 && pamixer --get-volume > $SWAYSOCK.wob";
      };
      "network" = {
        format = "{ifname}";
        format-wifi = "  {essid} ({signalStrength}%)";
        format-ethernet = "  {ifname}";
        format-disconnected = "Disconnected ⚠";
        tooltip-format = "  {ifname} via {gwaddri}";
        tooltip-format-wifi = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
        tooltip-format-ethernet = "  {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
        tooltip-format-disconnected = "Disconnected";
        max-length = 50;
        on-click = "nm-connection-editor";
        #on-click-right = "nm-connection-editor";    
      };
      "custom/vpn" = {
        # See github 
      };
      "clock"  = {
        format = "  {:%H:%M %a}";
        format-alt = "  {:%d/%m/%Y  %H:%M:%S}";
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        calendar = {
          mode = "month";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          on-click-right = "mode";
          format = {
            months = "<span color='#ffead3'><b>{}</b></span>";
            days = "<span color='#ecc6d9'><b>{}</b></span>";
            weeks = "<span color='#99ffdd'><b>W{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
        interval = 1;
      };
      # SwayNC notifications
      "custom/notifications" = {
        tooltip-format = "Left: Notifications\nRight: Do not disturb";
        format = "{icon}";
        format-icons = {
          notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
          none = "";
          dnd-notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
          dnd-none = "";
          inhibited-notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
          inhibited-none = "";
          dnd-inhibited-notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
          dnd-inhibited-none = "";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-cliennt -d -sw";
        escape = "true";
      };

      "tray" = {
        icon-size = 20;
        spacing = 10;
        show-passive-items = "true";
        reverse-direction = "false";
        smooth-scrolling-threshold = 1.0;
      };


    };

    # Style
    style = ''
* {
	border: none;
	border-radius: 0;
	font-family: 'JetBrains Mono', 'Hack Nerd Font', 'UbuntuMono', monospace;
	font-size: 14px;
	font-weight: 600;
	min-height: 0;
	padding: 0;
	margin: 0;
}

window#waybar {
	background: rgba(15, 15, 20, 0.3);
  border-bottom: 1px solid rgba(149, 127, 184, 0.3);
}

/* -----------------------------------------------------------------------------
* Tooltips
* -------------------------------------------------------------------------- */

tooltip {
	background: @background-primary;
	color: @text;
	border: 1px solid @border-color;
	border-radius: 8px;
	padding: 8px 12px;
}

tooltip label {
	color: @text;
	font-size: 12px;
}

/* -----------------------------------------------------------------------------
* Workspaces
* -------------------------------------------------------------------------- */

#workspaces {
	background: @background-primary;
	padding: 4px;
	margin: 6px 2px;
	border-radius: 12px;
	border: 2px solid @border-color;
}

#workspaces button {
	padding: 6px 10px;
	margin: 0 2px;
	background: @background-primary;
	color: @subtext0;
	border-radius: 8px;
	font-weight: bold;
	border: 1px solid @border-color;
}

#workspaces button:hover {
	background: @background-hover;
	color: @lavender;
	border-color: @mauve;
}

#workspaces button.active,
#workspaces button.focused {
	background: @mauve;
	color: @base;
	font-weight: bold;
	opacity: 1;
	border-color: @pink;
}

#workspaces button.empty {
	opacity: 0.3;
	background: @background-secondary;
}

#workspaces button.urgent {
	background: @error;
	color: @base;
	border-color: @maroon;
}

/* -----------------------------------------------------------------------------
* Window title
* -------------------------------------------------------------------------- */

#window {
	background: @background-secondary;
	color: @text;
	padding: 8px 16px;
	border-radius: 12px;
	border: 1px solid @border-color;
	font-weight: 500;
}

/* -----------------------------------------------------------------------------
* Clock
* -------------------------------------------------------------------------- */

#clock {
	background: @blue;
	color: @base;
	font-weight: bold;
	margin: 6px 2px 6px 2px;
	padding: 8px 12px;
	border-radius: 12px;
	font-size: 15px;
}

/* -----------------------------------------------------------------------------
* System monitoring modules
* -------------------------------------------------------------------------- */

#memory {
	background: @background-primary;
	color: @green;
	border-left: 4px solid @green;
	border-radius: 12px 0 0 12px;
	margin: 6px 0;
	padding: 8px 12px;
}

#cpu {
	background: @background-primary;
	color: @blue;
	border-left: 4px solid @blue;
	margin: 6px 0px 6px 0;
	padding: 8px 12px;
}

#temperature {
	background: @background-primary;
	color: @teal;
	border-left: 4px solid @teal;
	border-radius: 0 12px 12px 0;
	margin: 6px 2px 6px 0;
	padding: 8px 12px;
}

#temperature.critical {
	background: @error;
	color: @base;
	border-left: 4px solid @maroon;
}

/* -----------------------------------------------------------------------------
* Battery
* -------------------------------------------------------------------------- */

#battery {
	background: @background-primary;
	color: @green;
	border-left: 4px solid @green;
	margin: 6px 2px;
	padding: 8px 12px;
	border-radius: 12px;
}

#battery.charging {
	color: @yellow;
	border-left: 4px solid @yellow;
}

#battery.warning {
	background: @warning;
	color: @base;
	border-left: 4px solid @peach;
}

#battery.critical:not(.charging) {
	background: @error;
	color: @base;
	border-left: 4px solid @maroon;
}

/* -----------------------------------------------------------------------------
* Audio and Backlight
* -------------------------------------------------------------------------- */

#backlight {
	background: @background-primary;
	color: @yellow;
	border-left: 4px solid @yellow;
	border-radius: 12px 0 0 12px;
	margin: 6px 0 6px 2px;
	padding: 8px 12px;
}

#pulseaudio {
	background: @background-primary;
	color: @yellow;
	border-left: 4px solid @yellow;
	border-radius: 0 12px 12px 0;
	margin: 6px 2px 6px 0;
	padding: 8px 12px;
}

#pulseaudio.muted {
	color: @subtext0;
	border-left: 4px solid @subtext0;
}

/* -----------------------------------------------------------------------------
* Network
* -------------------------------------------------------------------------- */

#network {
	background: @background-primary;
	color: @green;
	border-left: 4px solid @green;
	margin: 6px 2px;
	padding: 8px 12px;
	border-radius: 12px;
}

#network.disconnected {
	color: @error;
	border-left: 4px solid @error;
}

#network.disabled {
	color: @subtext0;
	border-left: 4px solid @subtext0;
}

/* -----------------------------------------------------------------------------
* Language
* -------------------------------------------------------------------------- */

#language {
	background: @background-primary;
	color: @mauve;
	border-left: 4px solid @mauve;
	margin: 6px 0 6px 2px;
	padding: 8px 12px;
	border-radius: 12px 0 0 12px;
}

#keyboard-state {
	background: @background-primary;
	color: @mauve;
	border-left: 4px solid @mauve;
	margin: 6px 2px 6px 0;
	padding: 8px 12px;
	border-radius: 0 12px 12px 0;
}

/* -----------------------------------------------------------------------------
* Custom modules
* -------------------------------------------------------------------------- */

#custom-launcher {
	background: @mauve;
	color: @base;
	font-size: 16px;
	font-weight: bold;
	margin: 6px 2px 6px 8px;
	padding: 8px 14px 8px 10px;
	border-radius: 12px;
	border: 2px solid @pink;
}

#custom-weather {
	background: @background-primary;
	color: @blue;
	border-left: 4px solid @blue;
	margin: 6px 2px;
	padding: 8px 12px;
	border-radius: 12px;
}

#custom-updates {
	background: @background-primary;
	color: @yellow;
	border-left: 4px solid @yellow;
	margin: 6px 2px;
	padding: 8px 12px;
	border-radius: 12px;
}

#custom-updates.has-updates {
	background: @warning;
	color: @base;
	border-left: 4px solid @peach;
}

#custom-vpn {
	background: @background-primary;
	color: @teal;
	border-left: 4px solid @teal;
	margin: 6px 2px;
	padding: 8px 12px;
	border-radius: 12px;
}

#custom-vpn.connected {
	color: @success;
	border-left: 4px solid @success;
}

#custom-notification {
	background: @background-primary;
	color: @lavender;
	border-left: 4px solid @lavender;
	margin: 6px 2px;
	padding: 8px 12px;
	border-radius: 12px;
}

#custom-cava {
	background: @background-primary;
	color: @green;
	border-left: 4px solid @green;
	margin: 6px 2px;
	padding: 8px 12px;
	border-radius: 12px;
}

/* -----------------------------------------------------------------------------
* Tray
* -------------------------------------------------------------------------- */

#tray {
	background: @background-secondary;
	padding: 6px 10px;
	margin: 6px 8px 6px 2px;
	border-radius: 12px;
	border: 1px solid @border-color;
}

#tray > .passive {
	opacity: 0.7;
}

#tray > .needs-attention {
	background-color: @error;
	border-radius: 6px;
	color: @base;
}

/* -----------------------------------------------------------------------------
* Idle inhibitor
* -------------------------------------------------------------------------- */

#idle_inhibitor {
	background: @background-primary;
	color: @yellow;
	border-left: 4px solid @yellow;
	margin: 6px 2px;
	padding: 8px 12px;
	border-radius: 12px;
}

#idle_inhibitor.activated {
	background: @yellow;
	border-left: 4px solid @background-primary;
	color: @base;
}

#mode {
	background: @warning;
	color: @base;
	font-weight: bold;
	padding: 8px 16px;
	margin: 6px 8px;
	border-radius: 12px;
}

/* -----------------------------------------------------------------------------
* Hover effects
* -------------------------------------------------------------------------- */

#clock:hover,
#battery:hover,
#cpu:hover,
#memory:hover,
#temperature:hover,
#backlight:hover,
#network:hover,
#pulseaudio:hover,
#custom-launcher:hover,
#custom-notification:hover,
#custom-weather:hover,
#custom-updates:hover,
#custom-vpn:hover,
#language:hover,
#custom-cava:hover {
	opacity: 0.8;
}
      '';
  };
}
