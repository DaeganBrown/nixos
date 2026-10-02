{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ../../profiles/desktop.nix
  ];

  custom.boot.loader = "systemd-boot";

  networking.hostName = "ozy-pc";
  system.stateVersion = "26.05";

  # custom.display = {
  #   width = 3840;
  #   height = 2160;
  #   scale = 2.0;
  # };

  #custom.gpu.vendor = [ "amd" ];

  custom.users = {
    ozy = {
      admin = true;
      extraGroups = [
        "networkmanager"
        "video"
      ];
    };
  };
}
