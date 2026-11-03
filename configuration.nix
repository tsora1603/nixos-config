{ ... }:

{
  imports = [
    ./flatpaks.nix

    ./modules/boot.nix
    ./modules/desktop.nix
    ./modules/hardware.nix
    ./modules/system.nix
    ./modules/umbriel.nix
    ./modules/users.nix
    ./modules/gaming.nix
    ./modules/packages.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Keep the version from the original installation when upgrading NixOS.
  system.stateVersion = "26.05";
}
