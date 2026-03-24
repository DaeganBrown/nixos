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
    neofetch
    ocamlPackages.github
    obsidian
    pavucontrol
    playerctl
    rsync
    silver-searcher
    stoat-desktop
    swayimg
    tree
    vivaldi
    vscode
    wget
    zathura
    zip
  ];
}
