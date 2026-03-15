{ lib, ... }:

with lib;
let 
  device = "";
  hostName = "nixos";
  resolution = [ 1920 1080 ];
  searchEngine = "vivaldi";
  taskbar = {
    position = "top";
    marginSide = 10;
    marginTop = 7;
    fontSize = 15;
  };
  terminal = "kitty";
  theme = "gruvbox";
  username = "default";
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
      type = types.listOf types.int;
      default = resolution;
      description = "The resolution values of the screen";
      example = [
        [ 1920 1080 ]
        [ 3840 2160 ]
      ];
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
  };
}
