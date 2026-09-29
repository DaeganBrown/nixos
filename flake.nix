{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hardware.url = "github:nixos/nixos-hardware/master";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = 
    inputs:
    let
      inherit (import ./lib { inherit inputs; }) mkHost;  
    in
    {
      nixosConfigurations = {
        #=========================================================#
        # System Configs
        #=========================================================#
        installerIso  = mkHost { hostname = "isoimage";     };
        #=========================================================#
        # Users
        #=========================================================#
        capps         = mkHost { hostname = "capps";        };
        capps-laptop  = mkHost { hostname = "capps-laptop"; };
        ozy           = mkHost { hostname = "ozy";          };
        ozy-laptop    = mkHost { hostname = "ozy-laptop";   };
        spysi         = mkHost { hostname = "spysi";        };
        #=========================================================#
        # Servers
        #=========================================================#
        poweredge-720 = mkHost { hostname = "browncrashpad";};
      };
    };
}
