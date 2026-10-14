{ ... }:
{
  imports = [
    ./home-programs.nix
    ./shell.nix
    ./git.nix
    ./ghostty.nix
    ./fastfetch.nix
    ./fish.nix
    ./vesktop.nix
  ];

  home.stateVersion = "26.05";
}
