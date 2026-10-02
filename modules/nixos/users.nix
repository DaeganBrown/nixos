{ config, lib, ... }:
let
  cfg = config.custom.users;
in {
  options.custom.users = lib.mkOption {
    default = { };
    description = "Normal user accounts on this machine";
    type = lib.types.attrsOf (
      lib.types.submodule (
        { name, ... }:
        {
          options = {
            description = lib.mkOption {
              type = lib.types.str;
              default = name;
              description = "Full name shown by login managers";
            };
            admin = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = "Grant sudo access through wheel";
            };
            extraGroups = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              default = [ ];
            };
          };
        }
      )
    );
  };

  config = {
    users.users = lib.mapAttrs (_: u: {
      isNormalUser = true;
      inherit (u) description;
      extraGroups = u.extraGroups ++ lib.optional u.admin "wheel";
    }) cfg;

    home-manager.users = lib.mapAttrs (name: _: {
      imports = [ ../../users/${name}.nix ];
    }) cfg;
  };
}
