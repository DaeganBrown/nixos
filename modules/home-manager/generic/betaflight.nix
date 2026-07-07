{ pkgs, ... }:

let
  betaflightApp = pkgs.writeShellScriptBin "beta-flight" ''
    exec ${pkgs.chromium}/bin/chromium \
      --app=https://app.betaflight.com \
      --name=Betaflight \
      --class=Betaflight \
      --user-data-dir="$HOME/.config/betaflight-chrome-profile" \
      "$@"
  '';
in
{
  home.packages = [ betaflightApp ];

  xdg.desktopEntries.beta-flight = {
    name = "Betaflight App";
    genericName = "Flight Controller Configurator";
    exec = "beta-flight";
    icon = "chromium";
    categories = [ "Utility" ];
    terminal = false;
  };
}
