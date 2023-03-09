{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devenv = {
      url = "github:cachix/devenv/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, devenv, nixpkgs, home-manager, impermanence, lanzaboote }@inputs: {
    nixosConfigurations = {
      Skipper = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit devenv impermanence system;
        };
        modules = [
          {
            nixpkgs.overlays = [
              (import ./packages) # Overlay adding all custom packages
              (self: super: { devenv = devenv.packages.${system}.devenv; }) # Overlay for devenv.sh
            ];
          }

          { system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev; }

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
