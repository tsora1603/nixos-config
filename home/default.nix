{ ... }:
{
  imports = [
    ./fastfetch.nix
    ./fish.nix
    ./ghostty.nix
    ./git.nix
    ./home.nix
    ./kde
    ./shell.nix
    ./ssh.nix
    ./vesktop.nix
    ./yazi.nix
  ];

  home.stateVersion = "26.05";
}
