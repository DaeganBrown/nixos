{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
  };

  outputs = { self, nixpkgs,  ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
	        modules = [
	          ./hosts/default/configuration.nix
            inputs.home-manager.nixosModules.default
	        ];
	      };
        capps = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
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
	          ./hosts/ozy-laptop/configuration.nix
	          inputs.home-manager.nixosModules.default
	        ];
        };
      };
    };
}
