{ ... }:
{
  imports = [
    ./kde
    ./fastfetch.nix
    ./fish.nix
    ./ghostty.nix
    ./git.nix
    ./home.nix
    ./shell.nix
    ./ssh.nix
    ./vesktop.nix
    ./yazi.nix
  ];

  home.stateVersion = "26.05";
}
