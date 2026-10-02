{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ffmpeg_7
    spotify 
    vlc
  ];
}
