{ ... }:
{
  imports = [
    ./home.nix
    ./shell.nix
    ./ssh.nix
    ./git.nix
    ./ghostty.nix
    ./fastfetch.nix
    ./fish.nix
    ./kwin.nix
    ./vesktop.nix
    ./yazi.nix
  ];

  home.stateVersion = "26.05";
}
