{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [ 
    gnome-boxes 
    virt-viewer
    (writeShellScriptBin "uah-vm-up" ''
      STATE="$(virsh --connect qemu:///session domstate ubuntu22.04- 2>/dev/null)"
      if [ "$STATE" != "running" ]; then
        virsh --connect qemu:///session start ubuntu22.04-
        sleep 3
      fi
      virt-viewer --connect qemu:///session ubuntu22.04- --attach
    '')
    (writeShellScriptBin "uah-vm-down" ''
      virsh --connect qemu:///session shutdown ubuntu22.04-
    '')
  ];
  users.users.ozy.extraGroups = [ "libvirtd" ];
}
