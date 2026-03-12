{ config, pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 10823 ];
  services.openssh = {
    enable = true;
    ports = [ 10823 ];
    settings = {
      PasswordAuthentication = false;
      PubkeyAuthentication = "yes";
      AuthorizedKeysFile = ".ssh/authorized_keys";
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password";
    };
  };
}
