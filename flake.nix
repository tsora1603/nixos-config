{
  description = "tsora's NixOS config";

  nixConfig = {
    extra-substituters = [ "https://playit-nixos-module.cachix.org" ];
    extra-trusted-public-keys = [ "playit-nixos-module.cachix.org-1:22hBXWXBbd/7o1cOnh+p0hpFUVk9lPdRLX3p5YSfRz4=" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    playit-nixos-module.url = "github:pedorich-n/playit-nixos-module";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    qylock.url = "github:Darkkal44/qylock";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    bedrock-on-linux = {
      url = "github:Wyze3306/BedrockOnLinux/v2.2.9";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    lsfg-vk = {
      url = "github:Daaboulex/lsfg-vk-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  outputs = { self, nixpkgs, home-manager, bedrock-on-linux, nix-cachyos-kernel, playit-nixos-module, ... }@inputs: {
    nixosConfigurations.hephaestus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      modules = [
        (
          { pkgs, ... }:
          {
            nixpkgs.overlays = [
              nix-cachyos-kernel.overlays.pinned
            ];
          }
        )

        ./configuration.nix
        playit-nixos-module.nixosModules.default
        home-manager.nixosModules.home-manager
        inputs.qylock.nixosModules.default
        inputs.nix-flatpak.nixosModules.nix-flatpak

        {
          environment.systemPackages = [
            bedrock-on-linux.packages.x86_64-linux.default
          ];
        }
      ];
    }; # nixosSystem ends here
  };
}
