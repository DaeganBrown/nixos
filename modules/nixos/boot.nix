{ config, lib, ... }:
let
  cfg = config.custom.boot;
in {
  options.custom.boot = {
    loader = lib.mkOption {
      type = lib.types.nullOr (
        lib.types.enum [
          "systemd-boot"
          "grub-efi"
          "grub-bios"
        ]
      );
      default = null;
      description = "Boot loader to install. Null leaves the NixOS defaults alone.";
    };

    grubDevice = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "Disk to install GRUB on for BIOS systems.";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (cfg.loader == "systemd-boot") {
      boot.loader = {
        systemd-boot.enable = true;
        systemd-boot.configurationLimit = lib.mkDefault 20;
        efi.canTouchEfiVariables = true;
      };
    })

    (lib.mkIf (cfg.loader == "grub-efi") {
    })

    (lib.mkIf (cfg.loader == "grub-bios") {
    })
  ];
}
