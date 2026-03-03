{ options, config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      DefaultDownloadingDirectory = "\${home}/downloads";
      # ExtensionSettings = {
      # };
    };

    profiles.ozy = {
      bookmarks = {
       # search.nixos.org/packages
      };

      extensions = [
      # inputs.firefox-addons.packages."x86_64-linux".block-origin
      ];
    };
  };
}
