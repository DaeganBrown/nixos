{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      # "fileManager" = "dolphin";
      "$menu" = "hyprlauncher";

      ecosystem = {
        enforce_permissions = 1;
      };

      bind = [
	"$mod, RETURN, exec, $terminal"
	"$mod, S, exec, $menu"
      ]
      ++ (
	## workspaces
	builtins.concatLists ( builtins.genList (i:
	  let ws = i + 1;
	  in [
	    "$mod, code:1${toString i}, workspace, ${toString ws}"
	    "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
	  ]
	)
        9)
      );
    };
    extraConfig = ''
    exec-once = waybar &
    exec-once = swww &
    '';
  };
}
