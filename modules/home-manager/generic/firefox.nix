{ options, osConfig, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      DefaultDownloadingDirectory = "\${home}/downloads";
      # ExtensionSettings = {
      # };
    };

    profiles."${osConfig.username}" = {
      bookmarks = {
       # search.nixos.org/packages
      };
    };
  };
}
