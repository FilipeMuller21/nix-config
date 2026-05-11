{
  description = "My second flake";

  inputs = {
    #nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #niri
    niri.url = "github:sodiboo/niri-flake";
    #zen
    zen-browser = { 
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = { self, nixpkgs, niri, zen-browser, ... }@inputs :
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    nixosConfigurations = {
	nixos = nixpkgs.lib.nixosSystem {
	  inherit system;
	  specialArgs = {inherit inputs;};
          modules = [ ./configuration.nix ]; 
      };
    };
  };
}
