{
  description = "My awesome NixOS configuration inspired by Ampersand's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen.url = "github:iniox/matugen";

    nvf.url = "github:notashelf/nvf/v0.8";
  };

  outputs = { nixpkgs, home-manager, nvf, ... }@inputs: let
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
        ./hosts/${hostname}/configuration.nix

        home-manager.nixosModules.home-manager
        nvf.nixosModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = ./home-manager/home.nix;
          home-manager.extraSpecialArgs = {
            inherit inputs homeStateVersion user;
          };
        }
      ];
    };
    in {
      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostname}" = makeSystem {
          inherit (host) hostname stateVersion;
        };
      }) {} hosts;
    };
}
