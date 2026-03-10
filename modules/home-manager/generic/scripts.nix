{ pkgs, osConfig, ... }:

{
  home.packages = [
    # NixOS tools
    (pkgs.writeShellScriptBin "check-builds" ''
      nix-env --list-generations
    '')
    (pkgs.writeShellScriptBin "refresh-nix-config" ''
      nixos-rebuild switch --flake .#${osConfig.username}${osConfig.device}
    '')
    (pkgs.writeShellScriptBin "refresh-nix-config-button" ''
      cd /home/${osConfig.username}/nixos/ &&
      notify-send -t 1000 "Syncing with remote branch..." &&
      notify-send -t 1000 "$(git fetch && git pull)" &&
      notify-send -t 1000 "Rebuilding..." &&
      sudo refresh-nix-config &&
      notify-send -t 5000 "Succesfully Built!" 
      echo ||
      notify-send -t 5000 "Process Failed!"

    '')
  ];
}
