{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.kdePackages.qtmultimedia
    pkgs.kdePackages.qtbase
    pkgs.kdePackages.qtwayland
    pkgs.kdePackages.qtvirtualkeyboard
    pkgs.kdePackages.qt6ct
    pkgs.kdePackages.qt6gtk2
    pkgs.hyprland-qt-support
    ( pkgs.sddm-astronaut.override { embeddedTheme = "black_holw"; })
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = with pkgs; [ 
      sddm-astronaut
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtdeclarative
    ];
    package = pkgs.kdePackages.sddm;
  };
  
}
