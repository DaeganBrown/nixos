{ inputs, config, osConfig, pkgs, lib, ... }:

{
  imports = [
    # Other
    # Generics
    ../../modules/home-manager/generic/hyprland-core.nix
    ../../modules/home-manager/generic/hyprland-ctrls.nix
    ../../modules/home-manager/generic/hyprland-1920-1200.nix
    ../../modules/home-manager/generic/firefox.nix
    ../../modules/home-manager/generic/nvf.nix
    ../../modules/home-manager/generic/scripts.nix
    ../../modules/home-manager/generic/mako-default.nix
    ../../modules/home-manager/generic/kitty.nix
    ../../modules/home-manager/generic/dev.nix
    ../../modules/home-manager/generic/embedded-dev.nix
    ../../modules/home-manager/generic/ruby.nix
    ../../modules/home-manager/generic/hyprshot.nix
    # Mine
    ../../modules/home-manager/ozy/git-laptop.nix
    ../../modules/home-manager/ozy/starship.nix
    ../../modules/home-manager/ozy/zen.nix
    ../../modules/home-manager/generic/stylix.nix

    # uh
    inputs.nvf.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
  ];
  programs.fzf.enable = true;
  home.username = osConfig.username;
  home.homeDirectory = "/home/${osConfig.username}";
  programs.yazi = {
  enable = true;
  settings = {
    yazi = {
      opener = {
        play = [
          { run = ''mpv "$@"''; orphan = true; for = "unix"; }
        ];
        edit = [
          { run = ''$EDITOR "$@"''; block = true; for = "unix"; }
        ];
      };
      open.rules = [
        { mime = "video/*"; use = "play"; }
        { mime = "text/*"; use = "edit"; }
      ];
    };
  };
};

  home.stateVersion = "25.11"; # Please read the comment before changing.
  home.packages = [
    pkgs.hello
    pkgs.signal-desktop
    pkgs.orca-slicer
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.glab    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    # (pkgs.writeShellScriptBin "check-builds" ''
    #  nix-env --list-generations
    # '')
    (pkgs.writeShellScriptBin "countdown" ''
      target="2027-05-29 00:00:00"

      date=${pkgs.coreutils}/bin/date
      now=$($date +%s)
      end=$($date -d "$target" +%s)
      diff=$((end - now))

      if [ "$diff" -le 0 ]; then
        printf '{"text": "🎉", "tooltip": "The day has arrived", "class": "done"}\n'
        exit 0
      fi

      d=$((diff / 86400))
      h=$(( (diff % 86400) / 3600 ))
      m=$(( (diff % 3600) / 60 ))
      s=$((diff % 60))
      pretty=$($date -d "$target" '+%A, %B %-d %Y')

      printf '{"text": "%dd %02dh %02dm %02ds", "tooltip": "%s", "class": "counting"}\n' \
        "$d" "$h" "$m" "$s" "$pretty"
    '')
  ];

  home.file = {
    bashrc = {
      target = "/home/${osConfig.username}/.bashrc";
      text = ''
        eval "$(starship init bash)"
        export GITLAB_TOKEN="$(cat /home/ozy/.secret/glab-nix)"
      '';
    };
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
    EDITOR = "nvim";
  };
  xdg.userDirs = {
    enable = true;
    createDirectories = false;
    download = "${config.home.homeDirectory}/downloads";
    documents = "${config.home.homeDirectory}/documents";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
