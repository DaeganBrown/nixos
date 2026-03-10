{ lib, ... }:

with lib;
let 
  device = "";
  resolution = [ 1920 1080 ];
  search_engine = "vivaldi";
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
    resolution = mkOption {
      type = types.listOf types.int;
      default = resolution;
      description = "The resolution values of the screen";
      example = [
        [ 1920 1080 ]
        [ 3840 2160 ]
      ];
    };
    search_engine = mkOption {
      type = types.str;
      default = search_engine;
      description = "The default search engine used";
      example = [
        "vivaldi"
      ];
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
