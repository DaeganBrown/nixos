{ pkgs, osConfig, ... }:

{
  home.packages = [
    pkgs.wlr-randr
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
      SCREEN_W=$(${pkgs.wlr-randr}/bin/wlr-randr 2>/dev/null \
        | grep -oP '\d+x\d+' | head -1 | cut -dx -f1)

      if [ -z "$SCREEN_W" ]; then
        SCREEN_W=1920
      fi

      if [ "$SCREEN_W" -ge 3840 ]; then
        WIDTH=40; LINES=6; FONT_SIZE=14
      elif [ "$SCREEN_W" -ge 2560 ]; then
        WIDTH=32; LINES=5; FONT_SIZE=12
      else
        WIDTH=24; LINES=4; FONT_SIZE=11
      fi

      CHOICE=$(printf \
        "⬡  SWITCH\n⬡  TEST\n⬡  BOOT" \
        | fuzzel --dmenu \
          --prompt "SYSTEM ❯  " \
          --width "$WIDTH" \
          --lines "$LINES" \
          --font "monospace:size=$FONT_SIZE" \
          --inner-pad 12 \
          --line-height 28)

      case "$CHOICE" in
        *"SWITCH"*) refresh-nix-config-button switch ;;
        *"TEST"*)   refresh-nix-config-button test   ;;
        *"BOOT"*)   refresh-nix-config-button boot   ;;
      esac
    '')
    (pkgs.writeShellScriptBin "get-media-name" ''
      active_player=""
      for p in $(playerctl -l 2>/dev/null); do
        status=$(playerctl --player="$p" status 2>/dev/null)
        if [ "$status" = "Playing" ]; then
          active_player="$p"
          break
        fi
      done
      if [ -z "$active_player" ]; then
        echo ""
        exit 0
      fi
      title=$(playerctl --player="$active_player" metadata title 2>/dev/null)
      artist=$(playerctl --player="$active_player" metadata artist 2>/dev/null)
      if [ -z "$title" ]; then
        echo ""
      else
        if [ -z "$artist" ]; then
          text="$title"
        else
          text="$artist - $title"
        fi
        len=$(echo -n "$text" | wc -c)
        if [ "$len" -gt 40 ]; then
          text=$(echo -n "$text" | cut -c1-37)
          text="$text..."
        fi
        echo "{\"text\": \"$text\", \"class\": \"$active_player\"}"
      fi
    '')
  ];
}
