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
    lazygit
    fastfetch
    kdePackages.filelight
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
