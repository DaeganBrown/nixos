{ osConfig, inputs, pkgs, ... }:
# let
#   themeFile = "/home/${osConfig.username}/nixos/themes/${osConfig.theme}.nix";
# in
{
  # imports = [ themeFile ];
  imports = [ (inputs.self + "/themes/${osConfig.theme}.nix") ];
  stylix = {
    enable = true;
    autoEnable = false;
    targets = {
      fuzzel.enable = true;
      kitty.enable = true;
      mako.enable = true;
      nvf.enable = true;
      waybar.enable = true;
      gtk.enable = true;
      qt.enable = true;
    };
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
  };
}
