{ ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = {
      horizontal = 1920;
      vertical = 1200;
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
    wallpaper = "tron-red-bike.jpg";
    username = "ozy";
    monitor = "eDP-1";
  };
}
