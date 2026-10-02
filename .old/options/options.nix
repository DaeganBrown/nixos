{ lib, ... }:

with lib;
let 
  device = "";
  hostName = "nixos";
  resolution = {
    horizontal = 1920;
    vertical = 1080;
  };
  searchEngine = "vivaldi";
  taskbar = {
    position = "top";
    marginSide = 10;
    marginTop = 7;
    fontSize = 15;
  };
  terminal = "kitty";
  theme = "tron";
  username = "default";
  wallpaper = "retrowave-tron-grid.jpg";
  font = {
    base = "FiraCode Nerd Font";
    mono = "FiraCode Nerd Font Mono";
    size = 15;
  };
  monitor = "HDMI-A-1";
in
{
  options = {
    device = mkOption {
      type = types.str;
      default = device;
      description = "Device, so that user may have multiple";
    };
    hostName = mkOption {
      type = types.str;
      default = hostName;
      description = "Hostname of device";
    };
    resolution = mkOption {
      type = types.submodule {
        options = {
          horizontal = mkOption {
            type = types.int;
            default = resolution.horizontal;
            description = "The horizontal pixel count";
            example= [
              "1920"
              "2560"
              "3840"
            ];
          };
          vertical = mkOption {
            type = types.int;
            default = resolution.vertical;
            description = "The vertical pixel count";
            example = [
              "1080"
              "1440"
              "2160"
            ];
          };
        };
      };
      # default = resolution;
      # description = "The resolution values of the screen";
      # example = [
      #   [ 1920 1080 ]
      #   [ 3840 2160 ]
      # ];
    };
    searchEngine = mkOption {
      type = types.str;
      default = searchEngine;
      description = "The default search engine used";
      example = [
        "vivaldi"
      ];
    };
    taskbar = mkOption {
      type = types.submodule {
        options = {
          position = mkOption {
            type = types.str;
            default = taskbar.position;
            description = "Where on your screen your taskbar will be";
            example = [
              "top"
              "bottom"
              "left"
              "right"
            ];
          };
          marginSide = mkOption {
            type = types.int;
            default = taskbar.marginSide;
            description = "Left and right margin of the taskbar, in pixels";
          };
          marginTop = mkOption {
            type = types.int;
            default = taskbar.marginTop;
            description = "Top margin of the taskbar";
          };
          fontSize = mkOption {
            type = types.int;
            default = taskbar.fontSize;
            description = "Font size of taskbar";
          };
        };
      };
    };
    terminal = mkOption {
      type = types.str;
      default = terminal;
      description = "The default terminal emulator used";
      example = [
        "kitty"
        "alacritty"
        "ghostty"
      ];
    };
    theme = mkOption {
      type = types.str;
      default = theme;
      description = "The theme of the system";
      example = [
        "gruvbox"
        "nord"
        "tron"
      ];
    };
    username = mkOption {
      type = types.str;
      default = username;
      description = "The name of the main user";
    };
    wallpaper = mkOption {
      type = types.str;
      default = wallpaper;
      description = "Wallpaper file name";
    };
    monitor = mkOption {
      type = types.str;
      default = monitor;
      description = "Monitor to use for hyprland";
    };
    font = mkOption {
      type = types.submodule {
        options = {
          base = mkOption {
            type = types.str;
            default = font.base;
            description = "Base font for editors and terminal.";
          };
          mono = mkOption {
            type = types.str;
            default = font.mono;
            description = "Monospaced font for editors and terminals.";
          };
          size = mkOption {
            type = types.int;
            default = font.size;
            description = "Font size for terminal and editors";
          };
        };
      };
    };
  };
}
