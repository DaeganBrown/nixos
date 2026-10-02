{ pkgs, config, osConfig, ... }:

{
  home.packages = [
    # pkgs.waybar
    pkgs.cava
    pkgs.networkmanager_dmenu
  ];
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "${osConfig.taskbar.position}";
      mod = "dock";
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
        "custom/smallspacer"
        "custom/refresh"
        "custom/smallspacer"
        "custom/media"
        "custom/smallspacer"
        "cava"
      ];
      modules-center = [
        "custom/smallspacer"
        "hyprland/window"
        "custom/smallspacer"
      ];
      modules-right = [
        "custom/smallspacer"
        "group/tray"
        "network"
        "group/audio"
        "group/backlight"
        "memory"
        "cpu"
        "clock"
        "custom/notification"
        "battery"
        "custom/smallspacer"
      ];

      #=============#
      #= Multi Use =#
      #=============#
      "custom/smallspacer" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/spacer" = {
        format = "|";
        interval = "once";
        tooltip = false;
      };
      "custom/menu" = {
        format = "󰅃";
        rotate = 90;
        tooltip = false;
      };
      #================#
      #= Left Modules =#
      #================#
      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          default = "";
          active = ""; 
        };
      };
      "custom/steam" = {
        format = "  ";
        on-click = "open-or-focus steam steam";
        tooltip  = true;
        tooltip-format = "Steam";
      };
      "custom/vivaldi" = {
        format = "  ";
        on-click = "open-or-focus vivaldi vivaldi";
        tooltip = true;
        tooltip-format = "Vivaldi";
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
        on-click = "nixos-rebuild-menu";
        on-click-right = "refresh-nix-config-button";
        tooltip = true;
        tooltip-format = "Left: rebuild menu | Right: quick switch";
      };
      "custom/media" = {
        format = "{text}";
        exec = "get-media-name";
        exec-if = "playerctl --all-players status 2>/dev/null | grep -qE 'Playing'";
        tooltip = false;
        return-type = "json";
        interval = 3;
      };
      "cava" = {
        framerate = 60;
        autosens = 1;
        bars = 14;
        lower_cutoff_freq = 50;
        higher_cutoff_freq = 10000;
        method = "pipewire";
        source = "auto";
        stereo = true;
        reverse = false;
        bar_delimiter = 0;
        monstercat = true;
        waves = false;
        noise_reduction = 0.77;
        input_delay = 2;
        hide_on_silence = true;
        sleep_timer = 3;
        format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
      };
      #==================#
      #= Center Modules =#
      #==================#
      "hyprland/window" = {
        format = "<span weight='bold' >{class}</span>";
        max-length = 120;
        icon = false;
        icon-size = 13;
      };
      #=================#
      #= Right Modules =#
      #=================#
      "group/tray" = {
        orientation = "horizontal";
        drawer = {
          transition-duration = 600;
          transition-to-left = true;
          click-to-reveal = true;
        };
        modules = [
          "custom/menu"
          "custom/spacer"
          "tray"
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
        format-ethernet = "󰈀 ";
        tooltip-format = "Network: <big><b>{essid}</b></big> {bandwidthTotalBits}\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
        format-linked = "󰈀 {ifname} (No IP)";
        format-disconnected = " ";
        tooltip-format-disconnected = "Disconnected";
        on-click = "networkmanager_dmenu";
        interval = 2;
      };
      "group/audio" = {
        orientation = "horizontal";
        drawer = {
          transition-duration = 600;
          transition-to-left = true;
          click-to-reveal = true;
        };
        modules = [
          "pulseaudio"
          "pulseaudio/slider"
        ];
      };
      "pulseaudio" = {
        format = "{icon}";
        rotate = 0;
        format-muted = "󰖁";
        tooltip-format = "{icon} {desc} // {volume}%";
        scroll-step = 5;
        format-icons = {
          default = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
        };
      };
      "pulseaudio/slider" = {
        orientation = "horizontal";
        min = 5;
        max = 100;
        rotate = 0;
        device = "pulseaudio";
        scroll-step = 1;
      };
      "group/backlight" = {
        orientation = "horizontal";
        drawer = {
          transition-duration = 600;
          transition-to-left = true;
          click-to-reveal = true;
        };
        modules = [
          "backlight"
          "backlight/slider"
          "custom/smallspacer"
        ];
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
      "backlight/slider" = {
        min = 5;
        max = 100;
        rotate = 0;
        device = "intel_backlight";
        scroll-step = 1;
      };
      "memory" = {
        interval = 1;
        rotate = 0;
        format = "{icon}{used:0.1f}{icon}";
        format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        states = {
          warning = 70;
          critical = 90;
        };
        tooltip = true;
        tooltip-format = "Used: {used:0.2f} GiB\nTotal: {total} GiB\nSwap: {swapUsed} GiB/{swapTotal} GiB";
      };
      "cpu" = {
        interval = 1;
        rotate = 0;
        format = "{icon}";
        format-icons = [
          "󰋙"
          "󰫃"
          "󰫄"
          "󰫅"
          "󰫆"
          "󰫇"
          "󰫈"
        ];
      };
      "clock" = {
        format = "{:%I:%M %p}";
        rotate = 0;
        tooltip-format = "<tt>{calendar}</tt>";
        calendar = {
          mode = "month";
          mode-mon-col = 3;
          on-scoll = 1;
          on-click = "shift_reset";
          on-click-right = "mode";
          format = 
          let 
            c = config.lib.stylix.colors.withHashtag;
          in {
            months   = "<span color='${c.base07}'><b>{}</b></span>";
            days     = "<span color='${c.base05}'>{}</span>";
            weeks    = "<span color='${c.base03}'><b>W{}</b></span>";
            weekdays = "<span color='${c.base0C}'><b>{}</b></span>";
            today    = "<span color='${c.base00}' bgcolor='${c.base0C}'><b>{}</b></span>";
          };
        };
        actions = {
          on-click-right = "mode";
        };
      };
      "custom/notification" = {};
      "battery" = {
        states = {
          good = 95;
          warning = 30;
          critical = 20;
        };
        format = "{icon}";
        rotate = 0;
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
    };
    style = ''
      window#waybar { font-size: ${toString osConfig.taskbar.fontSize}px; }
    '' + builtins.readFile (./styles + "/${osConfig.theme}-style.css");
#       ''V
# * {
#   font-family: "JetBrainsMono Nerd Font Propo";
# }
#     '';
  };
}
