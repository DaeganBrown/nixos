{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ../../profiles/desktop.nix
  ];


  networking.hostName = "ozy-pc";
  system.stateVersion = "26.05";

  custom = {
    boot.loader = "systemd-boot";
    # display = {
    #   width = 3840;
    #   height = 2160;
    #   scale = 2.0;
    # };

    # gpu.vendor = [ "amd" ];

    users = {
      ozy = {
        admin = true;
        extraGroups = [
          "networkmanager"
          "video"
        ];
      };
    };
  };
}
