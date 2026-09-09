{ ... }:

{
  imports = [ ./options.nix ];

  config = {
    resolution = {
      horizontal = 3840;
      vertical = 2160;
    };
    searchEngine = "zen-beta";
    taskbar = {
      position = "bottom";
      fontSize = 15;
    };
    terminal = "kitty";
    theme = "tron";
    wallpaper = "tron-red-bike.jpg";
    username = "capps";
  };
}
