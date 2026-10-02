{ inputs, overlays }:
let
  inherit (inputs) nixpkgs home-manager stylix;
in
{
  mkHost = 
    {
      hostname,
      system ? "x86_64-linux",
      extraModules ? [ ],
    }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ../hosts/${hostname}
        ../modules/nixos
        { nixpkgs.overlays = overlays; }
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            sharedModules = [ ../modules/home ];
          };
        }
      ] ++ extraModules;
    };
}
