{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    # Generics
    ../../modules/home-manager/generic/hyprland-core.nix
    ../../modules/home-manager/generic/hyprland-ctrls.nix
    ../../modules/home-manager/generic/hyprland-4k.nix
    ../../modules/home-manager/generic/waybar-beautiful-minamalist.nix
    ../../modules/home-manager/generic/firefox.nix
    ../../modules/home-manager/generic/nvf.nix
    ../../modules/home-manager/spysi/git.nix

    # uh
    inputs.nvf.homeManagerModules.default
  ];
  home.username = "spysi";
  home.homeDirectory = "/home/spysi";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = [
    pkgs.hello
    pkgs.git
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    # (pkgs.writeShellScriptBin "check-builds" ''
    #  nix-env --list-generations
    # '')
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ozy/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
