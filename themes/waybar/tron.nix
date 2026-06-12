{ pkgs, osConfig, ... }:

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
        "group/power"
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
        format = "{icon} {text}";
        format-icons = {
          spotify = "";
          default = "🎵";
        };
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
        tooltip-format = "Network <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
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
      "group/backlight" = {};
      "group/power" = {};
      "memory" = {};
      "cpu" = {};
      "clock" = {};
      "custom/notification" = {};
      "battery" = {};
    };
    style = ''
* {
  font-family: "JetBrainsMono Nerd Font Propo";
}
    '';
  };
}
