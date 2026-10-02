{ inputs, pkgs, ... }:
let 
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in 
{
    environment.systemPackages = with pkgs; [
      vscode
      claude-code
    ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # add any libraries the binary complains about missing, e.g.:
    # stdenv.cc.cc
    # zlib
    # openssl
  ];
}
