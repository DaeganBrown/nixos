{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      # "fileManager" = "dolphin";
      "$menu" = "hyprlauncher";


      bind = [
	      "$mod, RETURN, exec, $terminal"
	      "$mod, S, exec, $menu"
        "$mod, V, togglefloating,"
      ] ++ (
	      ## workspaces
	      builtins.concatLists ( 
          builtins.genList (i:
	          let ws = i + 1;
	          in [
	            "$mod, code:1${toString i}, workspace, ${toString ws}"
	            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
	          ]
	        )
        9)
      );

      bindm = [
        "$mod, mouse:272, moveWindow"
        "$mod, mouse:273, resizeWindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
      extraConfig = ''
        exec-once = waybar &
        exec-once = swww &
      '';
    };
  };
}
