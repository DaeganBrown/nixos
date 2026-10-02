{ pkgs, ...}:

{
  stylix.targets.console.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session.command = ''
        ${pkgs.greetd.tuigreet}/bin/tuigreet \
        --time \
        --asterisks \
        --theme 'container=black;border=cyan;title=lightwhite;greet=blue;text=white;time=cyan;prompt=cyan;input=lightwhite;action=lightblack;button=red' \
        --cmd start-hyprland
      '';
    };
  };
  environment.etc."greetd/environments".text = ''
    hyprland
  '';
}
