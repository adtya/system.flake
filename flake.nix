{
  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = github:nix-community/NUR;
    };
  };

  outputs = { self, nixpkgs, home-manager, lanzaboote, nur }@inputs: {
    nixosConfigurations = {
      Skipper = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules =
          [
            {
              system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
              nixpkgs.overlays = [ nur.overlay ];
            }

            home-manager.nixosModules.home-manager
            lanzaboote.nixosModules.lanzaboote

            ./system
            ./users
            ./home
          ];
      };
    };
  };
}
