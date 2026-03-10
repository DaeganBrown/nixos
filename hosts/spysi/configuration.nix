{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix 
      ../../modules/nixos/common-pkgs.nix
      ../../modules/nixos/multi-media.nix 
      ../../modules/nixos/fonts.nix
      ../../modules/nixos/steam.nix 
      ../../modules/nixos/nvidia.nix
      ../../modules/nixos/discord.nix
      ../../modules/nixos/gdm.nix
      ../../modules/nixos/super-user-rules.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  # hardware
  hardware.graphics.enable = true;

  # nvidia things
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = true;
  # hardware.nvidia.prime.offload.enable = false;
  # hardware.nvidia.prime.sync.enable = false;

  # hyprland
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Sounds
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.spysi = {
    isNormalUser = true;
    description = "spysi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  
  # home manager 
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "spysi" = import ./home.nix;
    };
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    mako
    libnotify
    swww

  ];
  
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  system.stateVersion = "25.11"; # Did you read the comment?

}
