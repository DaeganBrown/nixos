{ ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = {
      horizontal = 3840;
      vertical = 2160;
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
    wallpaper = "tron-car-landscape.jpg";
    username = "ozy";
    font.size = 10;
  };
}
