{ inputs,... }:

{
  flake.nixosConfigurations = {
    nixos-pc = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # УДАЛЕНО: specialArgs = { inherit inputs; };
      modules = [
        # ПРАВИЛЬНЫЙ ПРОБРОС: Ленивая оценка через _module.args
        { _module.args.inputs = inputs; }

        inputs.home-manager.nixosModules.home-manager
        inputs.chaotic.nixosModules.nyx-cache
        inputs.chaotic.nixosModules.nyx-overlay
        inputs.chaotic.nixosModules.nyx-registry
        inputs.stylix.nixosModules.stylix

        ({ config, pkgs,... }: {
          nixpkgs.overlays = [ inputs.nur.overlays.default ];
          nixpkgs.config.allowUnfree = true;
          programs.neovim.finalPackage = inputs.lazy-nvim-nix.packages.x86_64-linux.default;
        })

      ../hosts/nixos-pc/configuration.nix
      ../hosts/nixos-pc/hardware-configuration.nix

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; }; # Для HM это пока нормально
            backupFileExtension = "backup";
            users.shpinog = import../hosts/nixos-pc/home.nix;
          };
        }
      ];
    };
  };
}