{ config, pkgs, ... }:

{
  networking.firewalls.allowedTCPPorts = [ 10823 ];
  services.openssh = {
    enable = false;
    ports = [ 10823 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohubut-password";
    };
  };
}
