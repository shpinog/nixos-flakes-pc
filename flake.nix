{
  description = "nix config";
  
  inputs = {
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

  outputs = { nixpkgs, home-manager, hyprland, nur, ... }@inputs: {
    nixosConfigurations = {
      nixos-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ 
          ./nixos/hosts/nixos-pc
          ./nixos/common/hyperland.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs = {
              overlays = [ nur.overlays.default ];
              config = {
                allowUnfree = true;
              };
            };
            
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.shpinog = { pkgs, ... }: {
                imports = [ ./home-manager/hosts/nixos-pc/nixos-pc.nix ];
                nixpkgs.config.allowUnfree = true;
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
}