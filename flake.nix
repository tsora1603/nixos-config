{
  description = "tsora's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";

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
  };

  outputs = { self, nixpkgs, home-manager, bedrock-on-linux, ... }@inputs: {
    nixosConfigurations.hephaestus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix
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

    packages.x86_64-linux.tidaler =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in
      import ./packages/tidaler.nix { inherit pkgs; };

    checks.x86_64-linux.tidaler =
      self.packages.x86_64-linux.tidaler;
  };
}
