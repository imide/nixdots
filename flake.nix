{
  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {self, ...}:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-darwin"];
      imports = [
        inputs.nixos-flake.flakeModule
      ];

      perSystem = {pkgs, ...}: let
        myUserName = "zach";
      in {
        legacyPackages.homeConfigurations.${myUserName} =
          self.nixos-flake.lib.mkHomeConfiguration
          pkgs
          ({pkgs, ...}: {
            imports = [self.homeModules.default];
            home.username = myUserName;
            home.homeDirectory = "/${
              if pkgs.stdenv.isDarwin
              then "Users"
              else "home"
            }/${myUserName}";
            home.stateVersion = "22.11";
          });
      };

      flake = {
        # All home-manager configurations are kept here.
        homeModules.default = {pkgs, ...}: {
          imports = [
            ./home/packages.nix
            ./home/fonts.nix
          ];
          programs = {
            git = {
              enable = true;
              userName = "imide";
              userEmail = "imide@imide.is-a.dev";
              ignores = ["*~" "*.swp"];
              aliases = {
                ci = "commit";
              };
              extraConfig = {
                init.defaultBranch = "master";
                pull.rebase = "false";
              };
            };
            lazygit.enable = true;
          };
        };

        direnv = {
          enable = true;
          nix-direnv.enable = true;
          config.global = {
            # Make direnv messages less verbose
            hide_env_diff = true;
          };
        };
      };
    };
}
