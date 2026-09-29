{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false;
    dedicatedServer.openFirewall = false;
    localNetworkGameTransfers.openFirewall = false;
    gamescopeSession.enable = false;
    extraPackages = [ pkgs.webkitgtk_4_1 ];
  };
}
