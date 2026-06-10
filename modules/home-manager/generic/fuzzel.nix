{ pkgs, config, osConfig, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font:size=${toString osConfig.taskbar.fontSize}";
        icon-theme = "hicolor";
        terminal = "kitty";
        width = 25;
        lines = 8;
        prompt = "❯  ";
      };
      colors = {
        background = "0F0F17ff";
        text = "A1BCCEff";
        match = "72D792ff";
        selection = "1a1a2eff";
        selection-text = "A1BCCEff";
        border = "ffffff1a"; 
      };
      border = {
        width = 2;
        radius = 10;
      };
    };
  };
}
