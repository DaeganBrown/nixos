{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ags
    btop 
    fzf
    git
    unixtools.ifconfig
    jq
    kitty
    lazygit
    neofetch
    pavucontrol
    playerctl
    silver-searcher
    stoat-desktop
    tree
    vivaldi
    wget
  ];
}
