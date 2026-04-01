{ config, lib, pkgs, ... }:

{
  home = {
    file = {
     "${config.xdg.configHome}/satty/config.toml".text =''
      [general]
      # Start Satty in fullscreen mode
      fullscreen = false
      # Exit directly after copy/save action
      early-exit = false
      # Select a tool on startup
      # Options: [ pointer, crop, line, arrow, rectangle, text, marker, blur, brush]
      initial-tool = "pointer"
      # Configure the command to be called on copy, for example, 'wl-copy'
      copy-command = "${pkgs.wl-clipboard}/bin/wl-copy"
      # Increase/Decrease annotation size
      annotation-size-factor = 1
      # Filename for saving
      output-filename = "${config.home.homeDirectory}/pictures/screenshots/screenshot-%Y%m%d-%H%M%S.png"
      save-after-copy = false
      default-hide-toolbars = false
      # Primary highlighter: block, freehand
      primary-highlighter = "block"
      disable-notifications = false
      # Font
      [font]
      family = "FiraCode Nerd Font"
      style = "Bold"
    '';
    
    
    # "${config.home.homeDirectory}/pictures/screenshots" = {
    #   source = ./screenshots;
    #   recursive = true;
    # };
    };
    activation.createSceenshotDir = 
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        mkdir -p "${config.home.homeDirectory}/pictures/screenshots"
      '';
    packages = with pkgs; [
      hyprshot
      satty
    ];
  };
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        ", Print, exec, ${lib.getExe pkgs.hyprshot} --mode region --raw | ${lib.getExe pkgs.satty} --filename -"
        "SHIFT, Print, exec, ${lib.getExe pkgs.hyprshot} --mode window --raw | ${lib.getExe pkgs.satty} --filename -"
        "ALT, Print, exec, ${lib.getExe pkgs.hyprshot} --mode output --raw | ${lib.getExe pkgs.satty} --filename -"
      ];
    };
  };

}
