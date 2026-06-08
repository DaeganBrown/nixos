{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ags
    btop
    base16-schemes
    flavours
    fzf
    git
    unixtools.ifconfig
    jq
    kitty
    lazygit
    fastfetch
    pavucontrol
    playerctl
    rsync
    silver-searcher
    swayimg
    tree
    vivaldi
    wget
    zathura
    zip
  ];
}
