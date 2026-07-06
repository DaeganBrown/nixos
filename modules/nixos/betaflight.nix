{ pkgs, config, ... }:

{
  ####################################
  # System-level: USB permissions
  ####################################
  services.udev.extraRules = ''
    # DFU bootloader mode (STM32)
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE="0664", GROUP="dialout", TAG+="uaccess"

    # DFU bootloader mode (AT32 / Artery MCUs)
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="df11", MODE="0664", GROUP="dialout", TAG+="uaccess"

    # Normal runtime mode (STM32 CDC/VCP - covers most FCs)
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", MODE="0664", GROUP="dialout", TAG+="uaccess",ENV{ID_MM_DEVICE_IGNORE}="1"
    SUBSYSTEM=="tty", ATTRS{idVendor}=="0483", MODE="0664", GROUP="dialout", TAG+="uaccess",ENV{ID_MM_DEVICE_IGNORE}="1"
  '';

  users.users."${config.username}".extraGroups = [ "dialout" ];

  ####################################
  # Home Manager: launcher + desktop entry
  ####################################
  home-manager.users."${config.username}" = { pkgs, ... }: {
    home.packages = [
      pkgs.edgetx
      (pkgs.writeShellScriptBin "beta-flight" ''
        exec ${pkgs.chromium}/bin/chromium \
          --app=https://app.betaflight.com \
          --name=Betaflight \
          --class=Betaflight \
          --user-data-dir="$HOME/.config/betaflight-chrome-profile" \
          "$@"
      '')
      (pkgs.writeShellScriptBin "edgetx-buddy" ''
      exec ${pkgs.chromium}/bin/chromium \
        --app=https://buddy.edgetx.org \
        --name=EdgeTXBuddy \
        --class=EdgeTXBuddy \
        --user-data-dir="$HOME/.config/edgetx-buddy-chrome-profile" \
        "$@"
      '')
    ];

    xdg.desktopEntries.beta-flight = {
      name = "Betaflight App";
      genericName = "Flight Controller Configurator";
      exec = "beta-flight";
      icon = "chromium";
      categories = [ "Utility" ];
      terminal = false;
    };
    xdg.desktopEntries.edgetx-buddy = {
      name = "EdgeTX Buddy";
      genericName = "RC Transmitter Configurator";
      exec = "edgetx-buddy";
      icon = "chromium";
      categories = [ "Utility" ];
      terminal = false;
    };
  };
}
