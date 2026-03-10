{ pkgs, osConfig, ... }:

{
  home.packages = [
    # NixOS tools
    (pkgs.writeShellScriptBin "check-builds" ''
      nix-env --list-generations
    '')
    (pkgs.writeShellScriptBin "refresh-nix-config" ''
      cd /home/${osConfig.username}/nixos/
      git fetch && git pull && nixos-rebuild switch --flake .#${osConfig.username}${osConfig.device}
    '')
  ];
}
