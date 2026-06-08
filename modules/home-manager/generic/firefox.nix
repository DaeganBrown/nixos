{ options, osConfig, lib, pkgs, config, ... }:

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
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };
}
