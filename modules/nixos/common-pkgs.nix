{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop 
    fzf
    git
    kitty
    neofetch
    silver-searcher
    tree
    wget 
  ];
}
