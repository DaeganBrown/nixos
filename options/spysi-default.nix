{ ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = {
      horizontal = "3840";
      vertical = "2160";
    };
    searchEngine = "vivaldi";
    taskbar = {
      position = "bottom";
      marginSide = 10;
      marginTop = 7;
      fontSize = 15;
    };
    terminal = "kitty";
    theme = "tron";
    wallpaper = "tron-blue-bike.jpg";
    username = "spysi";
  };
}
