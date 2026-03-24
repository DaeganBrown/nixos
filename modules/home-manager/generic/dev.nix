{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustc
    cargo
    cmake
    gcc
    jdk25_headless 
    plantuml
    
  ];
}
