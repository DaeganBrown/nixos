{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.blender
    pkgs.godot_4
  ];
}
