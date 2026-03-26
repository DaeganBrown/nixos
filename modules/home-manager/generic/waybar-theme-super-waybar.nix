{ pkgs, config, osConfig, ... }:

{
  # config and style taken from super waybar by Anik200
  # https://github.com/Anik200/dotfiles/blob/super-waybar/.config/waybar/
  home.packages = [ 
    pkgs.waybar
    pkgs.cava
  ];
  programs.waybar = {
    enable = true;
  };
  programs.waybar.settings.mainBar = {
    layer = "top";
    position = "${osConfig.taskbar.position}";
    # height = 30;
    output = [
      "eDP-1"
      "HDMI-A-1"
    ];
    mod = "docK";
    margin-left = osConfig.taskbar.marginSide;
    margin-right = osConfig.taskbar.marginSide;
    margin-top = osConfig.taskbar.marginTop;
    margin-bottom = 0;
    exclusive = true;
    passthrough = false;
    gtk-layer-shell = true;
    reload_style_on_change = true;

    modules-left = [
      "custom/smallspacer"
      "hyprland/workspaces"
      "custom/smallspacer"
      "custom/steam"
      "custom/smallspacer"
      "custom/vivaldi"
      "custom/smallspacer"
      "custom/discord"
      "custom/smallspacer"
      "custom/stoat"
      "custom/spacer"
      "custom/refresh"
      "custom/spacer"
      "cava"
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
      "battery"
      "custom/padd"
    ];
    "custom/steam" = {
      format = "  ";
      on-click = "open-or-focus steam steam";
      tooltip = true;
      tooltip-format = "Steam";
    };
    "custom/vivaldi" = {
      format = "  ";
      on-click = "open-or-focus vivaldi vivaldi";
      tooltip = true;
      tooltip-format = "vivaldi";
    };
    "custom/discord" = {
      format = "  ";
      on-click = "open-or-focus discordptb discord";
      tooltip = true;
      tooltip-format = "Discord";
    };
    "custom/stoat" = {
      format = " 󱌧 ";
      on-click = "open-or-focus stoat-desktop stoat";
      tooltip = true;
      tooltip-format = "Stoat";
    };
    "custom/refresh" = {
      format = "  ";
      on-click = "refresh-nix-config-button";
      tooltip = false;
    };

    "custom/led" = {
      format = "<span color='#021c18'>󰍿</span> <span color='#313436'></span> ";
      format-alt = "󰍿 <span color='#bbc2c7'></span> ";
      # on-click = "~/mouse.sh";
      # see github for shell script
      tooltip = false;
    };
    "upower" = {
      icon-size = 20;
      format = "";
      format-alt = "{}<span color='orange'>[{time}]</span>";
      tooltip = true;
      tooltip-spacing = 20;
      on-click-right = "pkill waybar & hyprctl dispatch exec waybar";
    };
    "upower#headset" = {
      format = "󰋎 {percentage}";
      native-path = "/org/freedsektop/UPower/devices/headset_dev_A6_98_9A_0D_D3_49";
      show-icon = false;
      tooltip = false;
    };
    "group/expand-4" = {
      orientation = "horizontal";
      drawer = {
        transition-duration = 600;
        children-class = "not-power";
        transition-to-left = true;
        click-to-reveal = true;
      };
      modules = [ "upower" "upower/headset" ];
    };
    "custom/smallspacer" = {
      format = " ";
      tooltip = false;
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
    "tray" = {
      icon-size = osConfig.taskbar.fontSize;
      show-passive-items = true;
      rotate = 0;
      spacing = 3;
    };
    "group/expand" = {
      orientation = "horizontal";
      drawer = {
        transition-duration = 600;
        children-class = "not-power";
        transition-to-left = true;
        click-to-reveal = true;
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
      tooltip = false;
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
      escape = true;
    };
    "hyprland/window" = {
      format = "<span weight='bold' >{class}</span>";
      max-length = 120;
      icon = false;
      icon-size = 13;
    };
    "custom/power" = {
      format = "@{}";
      rotate = 0;
      on-click = "ags -t ControlPanel";
      on-click-right = "pkill ags";
      tooltip = true;
    };
    "custom/spacer" = {
      format = "|";
      tooltip = false;
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
        "6" = ["eDP-1" "HDMI-A-1"];
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
      tooltip = true;
    };
    "custom/wbar" = {
      format = "𐌏{}";
      rotate = 0;
      exec = "echo ; echo show app menu";
      on-click = "wofi --show drun";
      on-click-right = "wbarconfgen.sh p";
      on-click-middle = "sleep 0.1 && quickapps.sh kitty firefox spotify code dolphin";
      interval = 86400;
      tooltip = true;
    };
    "custom/theme" = {
      format = "{}";
      rotate = 0;
      exec = "echo ; echo 󰟡 pick color";
      on-click = "hyprpicker";
      on-click-right = "themeswitch.sh -p";
      on-click-middle = "sleep 0.1 && themeselect.sh";
      interval = 86400;
      tooltip = true;
    };
    "custom/wallchange" = {
      format = "{}";
      rotate = 0;
      exec = "echo ; echo 󰆊 switch wallpaper";
      on-click = "swww img --transition-type grow --transition-pos 0.071,0.988 --transition-step 255 --transition-fps 60 /home/anik/Downloads/skyway.jpg";
      on-click-right = "swww img --transition-type grow --transition-pos 0.071,0.988 --transition-step 255 --transition-fps 60 /home/anik/Downloads/cloud.png";
      on-click-middle = "swww img --transition-type grow --transition-pos 0.071,0.988 --transition-step 255 --transition-fps 60 /home/anik/Downloads/gradient.jpg";
      on-scroll-up = "swww img --transition-type grow --transition-pos 0.071,0.988 --transition-step 255 --transition-fps 60 /home/anik/Downloads/torvalds.png";
      on-scroll-down = "swww img --transition-type grow --transition-pos 0.071,0.988 --transition-step 255 --transition-fps 60 /home/anik/Downloads/night.png";
      interval = 86400;
      tooltip = true;
    };
    "custom/mouse" = {};
    # See github 
    "wlr/taskbar" = {
      format = "{icon}";
      rotate = 0;
      icon-size = 18;
      icon-theme = "Tesla-circle-dracula";
      spacing = 0;
      tooltip-format = "{title}";
      on-click = "activate";
      on-click-middle = "close";
      ignore-list = [
        "Alacritty"
      ];
    };
    app_ids-mapping = {
      firefoxdeveloperedition = "firefox-developer-edition";
    };
    "custom/spotify" = {
      exec = "mediaplayer.py --player spotify";
      format = " {}";
      rotate = 0;
      return-type = "json";
      on-click = "playerctl play-pause --player spotify";
      on-click-right = "playerctl next --player spotify";
      on-click-middle = "playerctl previous --player spotify";
      on-scroll-up = "volumecontrol.sh -p spotify i";
      on-scroll-down = "volumecontrol.sh -p spotify d";
      max-length = 25;
      escape = true;
      tooltip = true;
    };
    "idle_inhibitor" = {
      format = "{icon}";
      rotate = 0;
      format-icons = {
        activated = "󰥔";
        deactivated = "";
      };
    };
    "clock" = {
      format = "{:%I:%M %p}";
      rotate = 0;
      on-click = "/usr/local/bin/ags -t ActivityCenter";
      tooltip-format = "<tt>{calendar}</tt>";
      calendar = {
        mode = "month";
        mode-mon-col = 3;
        on-scroll = 1;
        on-click-right = "mode";
        format = {
          months = "<span color='#ffead3'><b>{}</b></span>";
          weekdays = "<span color='#ffcc66'><b>{}</b></span>";
          today = "<span color='#ff6699'><b>{}</b></span>";
        };
      };
      actions = {
        on-click-right = "mode";
        on-click-forward = "tz_up";
        on-click-backward = "tz_down";
        on-scroll-up = "shift_up";
        on-scroll-down = "shift_down";
      };
    };
    "battery" = {
      states = {
        good = 95;
        warning = 30;
        critical = 20;
      };
      format = "{icon}";
      rotate = 0;
      format-charging = "<span color='#a6d189'>󱐋</span>";
      format-plugged = "󰂄";
      format-icons = [
        "󰂎"
        "󰁺"
        "󰁻"
        "󰁼"
        "󰁽"
        "󰁾"
        "󰁿"
        "󰂀"
        "󰂁"
        "󰂂"
        "󰁹"
      ];
      on-click-right = "pkill waybar & hyprctl dispatch exec waybar";
    };
    "backlight" = {
      device = "amdgpu_bl1";
      rotate = 0;
      format = "{icon}";
      format-icons = [
        "󰃞"
        "󰃝"
        "󰃟"
        "󰃠"
      ];
      scroll-step = 1;
      min-length = 2;
    };
    "group/expand-2" = {
      orientation = "horizontal";
      drawer = {
        transition-duration = 600;
        children-class = "not-power";
        transition-to-left = true;
        click-to-reveal = true;
      };
      modules = [
        "backlight"
        "backlight/slider"
        "custom/smallspacer"
        "custom/led"
      ];
    };
    "group/expand-3" = {
      orientation = "horizontal";
      drawer = {
        transition-duration = 600;
        children-class = "not-power";
        transition-to-left = true;
        click-to-reveal = true;
      };
      modules = [
        "pulseaudio"
        "pulseaudio/slider"
      ];
    };
    "network" = {
      tooltip = true;
      format-wifi = "{icon} ";
      format-icons = [
        "󰤟"
        "󰤢"
        "󰤥"
      ];
      rotate = 0;
      format-ethernet = "󰈀 ";
      tooltip-format = "Network <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
      format-linked = "󰈀 {ifname} (No IP)";
      format-disconnected = " ";
      tooltip-format-disconnected = "Disconnected";
      on-click = "/usr/local/bin/ags -t ControlPanel";
      interval = 2;
    };
    "pulseaudio" = {
      format = "{icon}";
      rotate = 0;
      format-muted = "";
      tooltip-format = "{icon} {desc} // {volume}%";
      scroll-step = 5;
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = [
          ""
          ""
          ""
        ];
      };
    };
    "pulseaudio#microphone" = {
      format = "{format_source}";
      rotate = 0;
      format-source = "";
      format-source-muted = "";
      on-click = "pavucontrol -t 4";
      on-click-middle = "volumecontrol.sh -i m";
      on-scroll-up = "volumecontrol.sh -i i";
      on-scroll-down = "volumecontrol.sh -i d";
      tooltip-format = "{format_source} {source_desc} // {source_volume}%";
      scroll-step = 5;
    };
    "custom/notifications" = {
      tooltip = false;
      format = "{icon} {}";
      rotate = 0;
      format-icons = {
        none = "";
      };
      return-type = "json";
      exec-if = "which dunstctl";
      exec = "notifications.py";
      on-click = "sleep 0.1 && dunstctl history-pop";
      on-clicl-middle = "dunstctl history-clear";
      on-click-right = "dunstctl close-all";
      interval = 1;
      escape = true;
    };
    "custom/keybindhint" = {
      format = " ";
      rotate = 0;
      on-click = "keybinds_hint.sh";
    };
    "custom/expand" = {
      on-click = "";
      format = "{}";
      exec = "";
    };
    # Padding Modules
    "custom/l_end" = {
      format = " ";
      interval = "once";
      tooltip = "false";
    };
    "custom/r_end" = {
      format = " ";
      interval = "once";
      tooltip = "false";
    };
    "custom/sl_end" = {
      format = " ";
      interval = "once";
      tooltip = "false";
    };
    "custom/sr_end" = {
      format = " ";
      interval = "once";
      tooltip = "false";
    };
    "custom/rl_end" = {
      format = " ";
      interval = "once";
      tooltip = "false";
    };
    "custom/rr_end" = {
      format = " ";
      interval = "once";
      tooltip = "false";
    };
    "custom/padd" = {
      format = " ";
      interval = "once";
      tooltip = "false";
    };
    "backlight/slider" = {
      min = 5;
      max = 100;
      rotate = 0;
      device = "intel_backlight";
      scroll-step = 1;
    };
    "pulseaudio/slider" = {
      min = 5;
      max = 100;
      rotate = 0;
      device = "pulseaudio";
      scroll-step = 1;
    };
  };
  programs.waybar.style = ''
* {
    font-family: "FiraCode Nerd Font";
    /*font-family: "FiraCode Nerd Font";*/
    font-weight: bold; 
    font-size: ${toString osConfig.taskbar.fontSize}px;
}

#workspaces,
#workspaces button,
#custom-steam,
#custom-vivaldi,
#custom-discord,
#custom-stoat,
#custom-refresh,
#battery,
#pulseaudio,
#network,
#cpu,
#memory,
#clock,
#tray {
  padding-top: 0;
  padding-bottom: 0;
  margin-top: 0;
  margin-bottom: 0;
}

#custom-notification {
  font-family: "FiraCode Nerd Font Propo";
  font-size: 17px;
 color: #A1BDCE;
 margin: 2px 0px 0px 0px;
}


window#waybar {
    background: #0F0F17; 
  /*  border-radius: 15px; */
 /*  border: 2px solid #124323; */
/* border: 0px solid #A1BDCE; */
 border: 3px solid rgba(255, 255, 255, 0.1);
 border-radius: 10px;
}


tooltip {
        background: #171717;
        color: #A1BDCE;
        font-size: ${toString osConfig.taskbar.fontSize}px;
        border-radius: 7px;
       border: 2px solid #101a24;


    }

#hyprland-workspaces {

  font-family: "FiraCode Nerd Font Propo";
}
#workspaces{
  font-family: "FiraCode Nerd Font Propo";
background: rgba(23, 23, 23, 0.0);
    color: #888789;
    box-shadow: none;
	text-shadow: none;
    border-radius: 9px;
    transition: 0.2s ease;
    padding-left: 4px;
    padding-right: 4px;
    padding-top: 1px;
}


#workspaces button {
  font-family: "FiraCode Nerd Font Propo";
background: rgba(23, 23, 23, 0.0);
    color: #A1BDCE;
    box-shadow: none;
	text-shadow: none;
    border-radius: 9px;
    transition: 0.2s ease;
    padding-left: 4px;
    padding-right: 4px;
    padding-top: 0;
 /*   animation: ws_normal 20s ease-in-out 1; */
}



#workspaces button.active {

 
  /* background-image: url("/home/anik/Documents/bar1.png");*/
    color: #A1BDCE;   
    transition: all 0.3s ease;
    padding-left: 4px;
    padding-right: 4px;
  /*  transition: all 0.4s cubic-bezier(.55,0.68,.48,1.682); */
}

#workspaces button:hover {
    background: none;
    color: #72D792;
    animation: ws_hover 20s ease-in-out 1;
    transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.682);
}

#taskbar button {
    box-shadow: none;
	text-shadow: none;
	font-size: 4px;
    padding: 0px;
    border-radius: 9px;
    margin-bottom: 3px;
    margin-left: 0px;
    padding-left: 3px;
    padding-right: 3px;
    margin-right: 0px;
    color: @wb-color;
    animation: tb_normal 20s ease-in-out 1;
}

#taskbar button.active {
    background: @wb-act-bg;
    color: @wb-act-color;
    margin-left: 3px;
    padding-left: 12px;
    padding-right: 12px;
    margin-right: 3px;
    animation: tb_active 20s ease-in-out 1;
    transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
    min-height: 9px; 
}

#taskbar button:hover {
    background: @wb-hvr-bg;
    color: @wb-hvr-color;
    animation: tb_hover 20s ease-in-out 1;
    transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
}

#tray menu * {
    min-height: 16px;
    font-weight: bold;
    font-size: ${toString osConfig.taskbar.fontSize}px;
    color: #A1BDCE;
}

#tray menu separator {
    min-height: 10px
}


#custom-spacer{
opacity: 0.0;
}
#custom-smallspacer{
opacity: 0.0;
}


#custom-mouse{
font-size: 14px;
margin-bottom: 6px;
background:  #161320;
}


#custom-power{
    font-size: ${toString osConfig.taskbar.fontSize}px;
    color: #FFFFFF;
    background:  rgba(22, 19, 32, 0.9);
    margin: 6px 0px 6px 0px;
    padding-left: 4px;
    padding-right: 4px;
    }

#backlight{
    color: #2096C0;
    background: rgba(23, 23, 23, 0.0);
    font-weight: normal;
    font-size: ${toString (osConfig.taskbar.fontSize + 4)}px;
    margin: 1px 0px 0px 0px;
    padding-left: 0px;
    padding-right: 2px;
 
}
#bluetooth,
#custom-cliphist{
    color: #E6E7E7;
    background:  #161320;
    opacity: 1;
    margin: 4px 0px 4px 0px;
    padding-left: 4px;
    padding-right: 4px;
 
}
#battery{
    font-weight: normal;
    font-size: ${toString (osConfig.taskbar.fontSize + 7)}px;
    color: #a6d189;
    background:  rgba(23, 23, 23, 0.0);
    opacity: 1;
    margin: 0px 0px 0px 0px;
    padding-left: 0px;
    padding-right: 0px;
 
}

#idle_inhibitor{
color: #24966e;
background: @bar-bg;
    opacity: 1;
    margin: 4px 0px 4px 0px;
    padding-left: 4px;
    padding-right: 4px;

}
#clock{
    color: #A1BDCE;
    font-size: ${toString osConfig.taskbar.fontSize}px;
    font-weight: 900;
    font-family: "FiraCode Nerd Font Propo";
    background: rgba(23, 23, 23, 0.0);
    opacity: 1;
    margin: 3px 0px 0px 0px;
    padding-left: 10px;
    padding-right: 10px;
    border: none;
    margin: 0px;
    
}
#pulseaudio{
font-weight: normal;
font-size: ${toString (osConfig.taskbar.fontSize + 3)}px;
color: #6F8FDB;
    background:  rgba(22, 19, 32, 0.0);
    opacity: 1;
    margin: 0px 0px 0px 0px;
    padding-left: 3px;
    padding-right: 3px;
}
#cpu{
  padding-top: 0;
  padding-bottom: 0;
  font-weight: normal;
  font-size: ${toString (osConfig.taskbar.fontSize + 7)}px;
  color: #915CAF;
}
#custom-led{
background: #427287;
color: #FFFFFF;
margin-top: 7px;
margin-bottom: 7px;
padding-left: 6px;
border-radius: 7px;
margin-right: 6px;
}
#custom-gpuinfo,
#custom-keybindhint,
#language,
#memory{
font-weight: normal;
font-size: ${toString (osConfig.taskbar.fontSize + 7)}px;
color: #E4C9AF;
}

@keyframes blink {
    to {
        color: #4a4a4a;
        
    }
}
#network{
color: #A1BDCE;
font-weight: normal;
font-size: ${toString (osConfig.taskbar.fontSize + 4)}px;
padding-right: 0px;
padding-left: 4px
}
#custom-notifications,
#custom-spotify,
#taskbar,
#custom-theme,
#custom-menu{
color: #A1BDCE;
background:  rgba(23, 23, 23, 0.0);
margin: 0px 0px 0px 0px;
    padding-left: 1px;
    padding-right: 1px;
    opacity: 0.9
}
#tray,
#custom-updates,
#custom-wallchange,
#custom-wbar,
#window{
color: #A1BDCE;
font-family: "FiraCode Nerd Font Propo";
font-size: ${toString osConfig.taskbar.fontSize}px
}
#custom-l_end,
#custom-r_end,
#custom-sl_end,
#custom-sr_end,
#custom-rl_end,
#cava,
#upower#headset,
#upower{
color: #a6d189;
}
#custom-rr_end {
font-weight: normal;
    color: #E8EDF0;
    background:  rgba(23, 23, 23, 0.0);
    opacity: 1;
    margin: 0px 0px 0px 0px;
    padding-left: 4px;
    padding-right: 4px;
  ;
    
}

#backlight-slider slider,
#pulseaudio-slider slider {
  background: #A1BDCE;
  background-color: transparent;
  box-shadow: none;
  margin-right: 7px;
}

#backlight-slider trough,
#pulseaudio-slider trough {
  margin-top: -3px;
  min-width: 90px;
  min-height: 10px;
  margin-bottom: -4px;
  border-radius: 8px;
  background: #343434;
}

#backlight-slider highlight,
#pulseaudio-slider highlight {
  border-radius: 8px;
  background-color: #2096C0;
}

#battery.charging, #battery.plugged {
	color: #E8EDF0;
	
}


#battery.critical:not(.charging) {
    color: red;
}


#taskbar {
    padding: 1px;
}

#custom-r_end {
    border-radius: 0px 7px 7px 0px;
    margin-right: 1px;
    padding-right: 3px;
}

#custom-l_end {
    border-radius: 7px 0px 0px 7px;
    margin-left: 1px;
    padding-left: 3px;
}

#custom-sr_end {
    border-radius: 0px;
    margin-right: 1px;
    padding-right: 3px;
}

#custom-sl_end {
    border-radius: 0px;
    margin-left: 1px;
    padding-left: 3px;
}

#custom-rr_end {
    border-radius: 0px 7px 7px 0px;
    margin-right: 1px;
    padding-right: 3px;
}

#custom-rl_end {
    border-radius: 7px 0px 0px 7px;
    margin-left: 1px;
    padding-left: 3px;
}


/* Style for launchers */

#custom-expand {
    min-width: 25px;
    color: #A1BDCE;
    font-size: ${toString osConfig.taskbar.fontSize}px;
}

#group-minimized {
    border-left: solid;
    border-left-width: 0.5;
}

#custom-steam,
#custom-vivaldi,
#custom-discord,
#custom-stoat,
#custom-refresh {
  font-family: "FiraCode Nerd Font Propo";
  font-size: ${toString (osConfig.taskbar.fontSize + 2)}px;
  color: #A1BDCE;
  padding-top: 0;
  padding-bottom: 0;
  margin-top: 0;
  margin-bottom: 0;

}
#custom-steam:hover,
#custom-vivaldi:hover,
#custom-discord:hover,
#custom-stoat:hover,
#custom-refresh:hover {
  color: #C6D7E1;
  box-shadow: inset 0 -6px 8px -5px #C6D7E1;
  transition: all 0.2s ease;

}
#cpu,
#memory {
  font-family: "FiraCode Nerd Font Propo";
  font-weight: normal;
  font-size: ${toString (osConfig.taskbar.fontSize + 7)}px;
  
  padding-top: 0;
  padding-bottom: 0;
  margin-top: 0;
  margin-bottom: 0;
}
  '';
}
