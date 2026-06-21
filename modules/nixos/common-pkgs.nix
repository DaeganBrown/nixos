{ pkgs-unstable, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ags
    btop-rocm
    base16-schemes
    flavours
    fzf
    git
    unixtools.ifconfig
    jq
    lazygit
    fastfetch
    kdePackages.filelight
    pavucontrol
    playerctl
    rsync
    silver-searcher
    swayimg
    tree
    (vivaldi.override {
      commandLineArgs = "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations";
    })
    # (pkgs-unstable.vivaldi.override {
    #     commandLineArgs = "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations";
    # })
    wget
    zathura
    zip
  ];
}
