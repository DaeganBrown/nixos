{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustc
    cargo
    cmake
    gnumake
    gcc
    jdk25_headless 
    plantuml
    
  ];
}
