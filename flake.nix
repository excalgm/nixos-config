{
  description = "My awesome NixOS configuration inspired by Ampersand's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    envf = {
      url = "git+https://codeberg.org/ae7er/envf.git?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, niri, nur, envf, ... }@inputs: let
    system = "x86_64-linux";
    homeStateVersion = "25.05";
    user = "q";
    # This code is taken from Ampersand (Andrey0189)'s flake.nix
    # https://github.com/Andrey0189/nixos-config-reborn/blob/5e905754822ab69b0b74c0ee722c74ab0a6a17f6/flake.nix#L29-L43
    hosts = [
      { hostname = "t480"; stateVersion = "25.05"; }
      { hostname = "b450m"; stateVersion = "25.05"; }
    ];

    makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs stateVersion hostname user;
      };

      modules = [
        {
          nixpkgs.overlays = [ niri.overlays.niri ];
          environment.systemPackages = [ envf.packages.${system}.default ];
        }
        ./hosts/${hostname}/configuration.nix
      ];
    };
    in {
      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem {
          inherit (host) hostname stateVersion;
        };
      }) {} hosts;
      
      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs homeStateVersion user;
        };

        modules = [
          nur.modules.homeManager.default
          niri.homeModules.niri
          niri.homeModules.stylix
          ./home-manager/home.nix
        ];
      };
    };
}
