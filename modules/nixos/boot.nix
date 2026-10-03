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
        efi.canTouchEfiVariables = true;
        systemd-boot.configurationLimit = lib.mkDefault 20;
      };
    })

    (lib.mkIf (cfg.loader == "grub-efi") {
      boot.loader.grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        configurationLimit = lib.mkDefault 20;
      };
    })

    (lib.mkIf (cfg.loader == "grub-bios") {
      boot.loader.grub = {
        enable = true;
        device = cfg.grubDevice;
        configurationLimit = lib.mkDefault 20;
      };
      assertions = [
        {
          assertion = cfg.grubDevice;
          message = "custom.boot.grubDevice must be set when custom.noot.loader is grub-bios";
        }
      ];
    })
  ];
}
