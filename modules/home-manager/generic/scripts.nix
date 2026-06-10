{ pkgs, osConfig, ... }:

{
  home.packages = [
    # NixOS tools
    (pkgs.writeShellScriptBin "check-builds" ''
      nix-env --list-generations
    '')
    (pkgs.writeShellScriptBin "refresh-nix-config" ''
      SUBCMD=''${1:-switch}
      nixos-rebuild $SUBCMD --flake .#${osConfig.username}${osConfig.device}
    '')
    (pkgs.writeShellScriptBin "refresh-nix-config-button" ''
      SUBCMD=''${1:-switch}
      cd /home/${osConfig.username}/nixos/ || {
        notify-send -t 5000 -u critical "Rebuild Failed" "Could not find nixos config directory"
        exit 1
      }
      notify-send -t 1000 "Syncing with remote branch..."
      git fetch 2>&1
      GIT_OUTPUT=$(git pull 2>&1)
      GIT_STATUS=$?
      if [ $GIT_STATUS -ne 0 ]; then
        notify-send -t 5000 -u critical "Rebuild Failed" "Git pull failed: $GIT_OUTPUT"
        exit 1
      fi
      notify-send -t 1000 "Git: $GIT_OUTPUT"
      notify-send -t 1000 "Rebuilding ($SUBCMD)..."

      if sudo refresh-nix-config $SUBCMD; then
        notify-send -t 5000 "Successfully Built!"
      else
        notify-send -t 5000 -u critical "Rebuild Failed" "nixos-rebuild $SUBCMD failed - check journalctl for details"
      fi
    '')
    (pkgs.writeShellScriptBin "open-or-focus" ''
      execCommand=$1
      className=$2
      running=$(hyprctl -j clients | jq -r ".[] | select(.class ==  \"$className\") | .class")
      
      if [[ -n "$running" ]]; then
        hyprctl dispatch focuswindow "class:^($className)$"
      else
        hyprctl dispatch exec "$execCommand"
      fi
    '')
    (pkgs.writeShellScriptBin "nixos-rebuild-menu" ''
      CHOICE=$(printf "  Switch\n  Test\n  Boot" | fuzzel --dmenu --prompt "rebuild ❯  " --width 20 --lines 3)
      case "$CHOICE" in
        *"Switch") refresh-nix-config-button switch ;;
        *"Test")   refresh-nix-config-button test   ;;
        *"Boot")   refresh-nix-config-button boot   ;;
      esac
    '')
  ];
}
