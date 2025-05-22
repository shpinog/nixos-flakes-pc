{
  description = "nix config";
  
  inputs = {
    niri.url = "github:sodiboo/niri-flake";
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
    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, stylix, nur, niri, ... }@inputs: {
    nixosConfigurations = {
      nixos-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ 
          ./nixos/hosts/nixos-pc
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          niri.nixosModules.niri

          {
            nixpkgs = {
              overlays = [
              nur.overlays.default
              niri.overlays.niri
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
              users.shpinog = { pkgs, ... }: {
                imports = [ ./home-manager/hosts/nixos-pc/nixos-pc.nix ];
              };
            };
          }
        ];
      };
      
      nixos-book = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ 
          ./nixos/hosts/nixos-book
          home-manager.nixosModules.home-manager
          {
            nixpkgs = {
              config = {
                allowUnfree = true;
              };
            };
            
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.shpinog = { pkgs, ... }: {
                imports = [ ./home-manager/hosts/nixos-book/nixos-book.nix ];
                nixpkgs.config.allowUnfree = true;
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
