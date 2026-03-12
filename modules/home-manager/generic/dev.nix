{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustc
    cargo
    gcc
    
  ];
}
