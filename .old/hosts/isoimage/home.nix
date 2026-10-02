{ inputs, osConfig, pkgs }:

{
  imports = [
    ../../modules/home-manager/generic/scripts.nix
    ../../modules/home-manager/generic/nvf.nix
    inputs.nvf.homeManagerModules.default
];
  home.username = osConfig.username;
  home.homeDirectory = "/home/${osConfig.username}";
  home.stateVersion = "25.11";
  home.packages = [
    (pkgs.writeShellScriptBin "confirm-git" ''
      echo "currently nonfunctional"
    '')
  ];
  programs.home-manager.enable = true;
}
