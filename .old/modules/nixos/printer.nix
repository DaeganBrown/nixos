{ pkgs, ... }:

{
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser pkgs.gutenprint ]; # or specific driver for your printer
  services.avahi = {
    enable = true;
    nssmdns4 = true;  # lets you discover printers on the network
    openFirewall = true;
  };
}
