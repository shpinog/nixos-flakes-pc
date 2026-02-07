{
  description = "nix config";

  inputs = {
    lazy-nvim-nix = {
      url = "github:josh/lazy-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # niri.url = "github:sodiboo/niri-flake";
    #stylix
    stylix.url = "github:nix-community/stylix";
    #Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # NUR
    nur = {
      url = "github:nix-community/NUR";
    };
    #chaotic
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      chaotic,
      stylix,
      nur,
      lazy-nvim-nix,
      ...
    }@inputs:
    {
      homeModules.default = {
        programs.neovim.finalPackage = lazy-nvim-nix.packages.x86_64-linux.LazyVim;
      };
      nixosModules.default = {
        programs.neovim.finalPackage = inputs.lazy-nvim-nix.packages.x86_64-linux.default;
      };


      nixosConfigurations = {
        nixos-pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            home-manager.nixosModules.home-manager
            chaotic.nixosModules.nyx-cache
            chaotic.nixosModules.nyx-overlay
            chaotic.nixosModules.nyx-registry
            stylix.nixosModules.stylix
            ./nixos/hosts/nixos-pc

            {
              nixpkgs = {
                overlays = [
                  nur.overlays.default
                ];
                config = {
                  allowUnfree = true;
                };
              };

              home-manager = {
                backupFileExtension = "backup";
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.shpinog =
                  { pkgs, ... }:
                  {
                    imports = [
                      ./home-manager/hosts/nixos-pc/nixos-pc.nix
                    ];

                  };
              };
            }
          ];
        };

      };
    };
  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

}
