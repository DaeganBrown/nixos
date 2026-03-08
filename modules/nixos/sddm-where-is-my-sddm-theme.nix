{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.where-is-my-sddm-theme
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
    theme = "${pkgs.where-is-my-sddm-theme.override { variants = [ "qt5" ]; }}/share/sddm/themes/where_is_my_sddm_theme_qt5";
  };

  
}
