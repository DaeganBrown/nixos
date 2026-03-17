{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    hardware.url = "github:nixos/nixos-hardware/master";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        #=========================================================#
        # System Configs
        #=========================================================#
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
	        modules = [
	          ./hosts/default/configuration.nix
            inputs.home-manager.nixosModules.default
	        ];
	      };
        installerIso = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./options/iso-default.nix
            ./hosts/isoimage/configuration.nix
          ];
        };
        #=========================================================#
        # Users
        #=========================================================#
        capps = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./options/capps-default.nix
            ./hosts/capps/configuration.nix 
            inputs.home-manager.nixosModules.default
            #nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
          ];
        };
        ozy = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/ozy/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
	      ozy-laptop = nixpkgs.lib.nixosSystem {
	        specialArgs = { inherit inputs; };
	        modules = [
            ./options/ozy-default.nix
            {
              device = "-laptop";
            }
	          ./hosts/ozy-laptop/configuration.nix
	          inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
	        ];
        };
        spysi = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./options/spysi-default.nix
            ./hosts/spysi/configuration.nix 
            inputs.home-manager.nixosModules.default
          ];
        };
        #=========================================================#
        # Servers
        #=========================================================#
        admin-PowerEdge-720 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./options/server-poweredge-720.nix
            {
              device = "-poweredge-720";
            }
	    ./hosts/server-poweredge-720/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
