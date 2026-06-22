{ inputs, pkgs, osConfig, ... }:

{
  imports = [ (inputs.self + "/themes/waybar/${osConfig.theme}.nix") ];
  stylix = {
    base16Scheme = {
      base00 = "010b13";  # near-black background
      base01 = "0a1628";  # darker panels
      base02 = "0d2137";  # selection/highlights
      base03 = "1a3a5c";  # comments, gutters
      base04 = "4a9eca";  # secondary UI
      base05 = "7fcfff";  # default text (cyan-white)
      base06 = "b3e5ff";  # light text
      base07 = "e0f4ff";  # bright text
      base08 = "ff4f4f";  # errors/warnings (red)
      base09 = "ff9f4f";  # numbers/orange
      base0A = "ffe74f";  # warnings/yellow
      base0B = "4fffb0";  # strings (green)
      base0C = "4fffff";  # regex/escape (cyan)
      base0D = "4fb3ff";  # functions/blue
      base0E = "c77dff";  # keywords (purple)
      base0F = "ff6ec7";  # special/deprecated (magenta)
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sizes = {
        terminal = osConfig.font.size;
      };
    };
    opacity = {
      terminal = 0.85;
      popups = 0.90;
      desktop = 0.85;
    };
  }; 
  wayland.windowManager.hyprland.settings = {
    general = {
      border_size = 2;
      "col.active_border" = "rgba(4ffffffe) rgba(4fb3ffee) 45deg";
      "col.inactive_border" = "rgba(0a162888)";
    };
    decoration.blur = {
      enabled = true;
      size = 6;
      passes = 2;
      vibrancy = 0.2;
    };
    layyerrule = [ 
      "blur, notifications"
      "blur, fuzzel"
      "ignorezero, fuzzel"
    ]; 
  };
  home.packages = with pkgs; [ jq socat ];
  home.file.".config/hypr/scripts/window-close-sound.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"
      declare -A classes

      # Populate existing windows
      while IFS=$'\t' read -r addr class; do 
        classes["$addr"]="$class"
      done < <(
        hyprctl clients -j | jq -r '.[] | "\(.address)\t\(.class)"'
      )

      socat - UNIX-CONNECT:"$SOCKET" | while read -r line; do 
        case "$line" in 

          openwindow*)
            hyprctl clients -j | jq -r '.[] | "\(.address)\t\(.class)"' |
            while IFS=$'\t' read -r addr class; do 
              classes["$addr"]="$class"
            done
            ;;

          closewindow*)
            addr="''${line#*>>}"

            class="''${classes[$addr]}"

            if [[ "$class" != "kitty" ]]; then
              pw-play "$HOME/nixos/themes/audio/tron/end-of-line.mp3" >/dev/null 2>&1 &
            fi

            unset classes["$addr"]
            ;;
        esac
      done
    '';
  };
}
