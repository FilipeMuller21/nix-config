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
    #nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    #doom emacs
    nix-doom-emacs-unstraightened = {
    url = "github:marienz/nix-doom-emacs-unstraightened";
    };
    #spicetify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

  };

  outputs = { self, nixpkgs, niri, zen-browser, nixvim, spicetify-nix, nix-doom-emacs-unstraightened,... }@inputs :
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    nixosConfigurations = {
	nixos = nixpkgs.lib.nixosSystem {
	  inherit system;
	  specialArgs = {inherit inputs;};
          modules = [ ./configuration.nix
		inputs.spicetify-nix.nixosModules.default
		inputs.nixvim.nixosModules.default
	  ];

      };
    };
  };
}
