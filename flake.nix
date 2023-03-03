{
  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = github:nix-community/NUR;
    };
  };

  outputs = { self, nixpkgs, home-manager, impermanence, lanzaboote, nur }@inputs: {
    nixosConfigurations = {
      Skipper = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules =
          [
            {
              system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
              nixpkgs.overlays = [ nur.overlay (import ./packages) ];
            }

            home-manager.nixosModules.home-manager
            impermanence.nixosModules.impermanence
            lanzaboote.nixosModules.lanzaboote

            ./system
            ./users
            ./home
          ];
      };
    };
  };
}
