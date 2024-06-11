{
  description = "arithmetic - my wip dots";

  outputs = inputs@{
    self,
    home-manager,
    nix-darwin,
    nixpkgs,
    ...
  }: {
    overlays = import ./overlays { inherit inputs; };

    darwinConfigurations = {
      "macos" = nix-darwin.lib.darwinSystem {
        modules = [
          ./macos/macos.nix
          home-manager.darwinModules.home-manager
          (let
            username = "zacharyworen";
            in {
              users.users.${username} = {
                name = username;
                home = "/Users/${username}";
                };
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit inputs;
                    };
                    users."${username}" = {
                      home.username = username;
                      home.homeDirectory = "/Users/${username}";
                      imports = [./macos/home.nix];
                  };
                };
                networking = {
                  hostName = "Zacharys-Laptop";
                  computerName = "Zacharys-Laptop";
                };
            })
        ];
      };
    };

    homeConfigurations = {
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-f2k.url = "github:moni-dz/nixpkgs-f2k";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-cursor-src = {
      url = "github:ful1e5/apple_cursor";
      flake = false;
    };

    decay-discord-src = {
      url = "github:decaycs/decay-discord";
      flake = false;
    };
};
};
}