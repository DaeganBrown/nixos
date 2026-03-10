{ config, ... }:

{
  security.sudo.extraRules = [
    {
      users = [ "${config.username}" ];
      commands = [
        {
          command = "/home/${config.username}/.nix-profile/bin/refresh-nix-config";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
