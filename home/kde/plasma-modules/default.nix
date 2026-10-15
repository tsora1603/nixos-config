# All settings split from the previous monolithic home/kde/kwin.nix.
{ ... }:
{
  imports = [
    ./appearance.nix
    ./wallpapers.nix
    ./kwin.nix
    ./karousel.nix
    ./shortcuts.nix
    ./input.nix
    ./applications.nix
    ./services.nix
  ];
}
