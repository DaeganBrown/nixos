{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [ gnome-boxes ];
  users.users.ozy.extraGroups = [ "libvirtd" ];
}
