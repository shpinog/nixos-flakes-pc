# sudo nixos-rebuild switch --flake .#nixos-pc
# home-manager switch --flake .#shpinog@nixos-pc
{
  description = "nix config";
  
  inputs = {
    
    #Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1&ref=refs/tags/v0.42.0";
    impermanence.url = "github:nix-community/impermanence";
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    unstable.url = "nixpkgs/nixos-23.11";
    nur = {
      url = github:nix-community/NUR;
    };
    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { nixpkgs, home-manager, impermanence, unstable, hyprland, ... }@inputs: {
    nixosConfigurations = {
      nixos-pc = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ 
           hyprland.nixosModules.default
          ./nixos/hosts/nixos-pc
          ./nixos/common/hyperland.nix
        ];
      };
      
      nixos-book = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ 
          ./nixos/hosts/nixos-book
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "shpinog@nixos-pc" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        # > Our main home-manager configuration file <
        modules = [
          ./home-manager/hosts/nixos-pc/nixos-pc.nix
        ];
      };

      "shpinog@nixos-book" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        # > Our main home-manager configuration file <
        modules = [
          ./home-manager/hosts/nixos-book/nixos-book.nix
          hyprland.homeManagerModules.default
        ];
      };
    };
  };
}
