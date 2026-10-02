{ config, pkgs, lib, ... }:
{
  services.greetd = {
    enable = true;
  };
  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        application_prefer_dark_theme = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    cage
    regreet
  ];
}
