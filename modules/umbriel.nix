{ pkgs, inputs, ... }:

let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  imports = [
    "${inputs.nixpkgs-unstable}/nixos/modules/programs/wayland/umbriel.nix"
  ];

  programs.umbriel = {
    enable = true;
    package = unstable.umbriel;
    portalPackage = unstable.xdg-desktop-portal-umbriel;
  };
}