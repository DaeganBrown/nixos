{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      # "fileManager" = "dolphin";
      "$menu" = "hyprlauncher";

      # gestures, may not be supported in nix. TBD
      gestures = [
        "3, horizontal, workspace"
      ];
      bind = [
	      "$mod, RETURN, exec, $terminal"
	      "$mod, S, exec, $menu"
        "$mod, V, togglefloating,"
        "$mod, D, killactive"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, F, fullscreen"
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
      extraConfig = {
        exec-once = [
          "sleep 0.5 && swww-daemon"
          "sleep 0.5 && sww img ~/nixos/wallpaper/retrowave-tron-grid.jpg"
          "sleep 0.5 && waybar"
        ];
      };
    };
  };
}
