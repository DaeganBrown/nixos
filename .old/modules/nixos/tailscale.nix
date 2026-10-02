{ config, pkgs, inputs, ... }:
{ 
  services.tailscale.enable = true;
  services.tailscale.package = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.tailscale;
  networking.firewall.allowedUDPPorts = [ config.services.tailscale.port ];
}
