{ ... }:

{
  networking = {
    networkmanager = {
      enable = true;

      ensureProfiles.profiles = {
        ethernet-mdr = {
          connection = {
            id = "ethernet-mdr";
            type = "ethernet";
            interface-name = "enp2s0";
            autoconnect = true;
          };
          ipv4 =  {
            method = "manual";
            addresses = "192.168.50.66/24";
            # gateway = "";
            # dns = "";
            ignore-auto-dns = true;
            never-default = true;
            route-metric = 900;
          };

          ipv6 = {
            method = "disabled";
          };
        };
      };
    };
  };
}
