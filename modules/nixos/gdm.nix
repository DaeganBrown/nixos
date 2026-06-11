{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gdm
  ];

  services.displayManager.gdm = {
    enable = true;
    settings = {
      "org/gnome/login-screen" = {
        disable-user-list = true;
      };
    };
  };
  services.desktopManager.gnome.enable = true;
}
