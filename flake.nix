{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, lanzaboote }@inputs: {
    nixosConfigurations = {
      Skipper = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          { system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev; }
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
