{ pkgs, config, ... }:
{
  ####################################
  # Home Manager: launcher + desktop entry
  ####################################
  home-manager.users."${config.username}" = { pkgs, ... }: {
    home.packages = [
      (pkgs.writeShellScriptBin "xbox-app" ''
        exec ${pkgs.chromium}/bin/chromium \
          --app=https://www.xbox.com/play \
          --name=Xbox \
          --class=Xbox \
          --user-data-dir="$HOME/.config/xbox-chrome-profile" \
          "$@"
      '')
    ];
    xdg.desktopEntries.xbox-app = {
      name = "Xbox";
      genericName = "Xbox Cloud Gaming & Party Chat";
      exec = "xbox-app";
      icon = "chromium";
      categories = [ "Game" ];
      terminal = false;
    };
  };
}
