{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gdm
  ];

  services.displayManager.gdm = {
    enable = true;
  };
  services.desktopManager.gnome.enable = true;
}
