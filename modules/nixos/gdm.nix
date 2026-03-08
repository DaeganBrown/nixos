{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gdm
  ];

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
}
