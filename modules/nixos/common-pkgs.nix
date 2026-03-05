{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop 
    fzf
    git
    kitty
    tree
    wget 

  ];
}
