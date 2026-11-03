{ ... }:
{
  imports = [
    ./apps.nix
    ./kde
    ./fastfetch.nix
    ./fish.nix
    ./ghostty.nix
    ./git.nix
    ./shell.nix
    ./ssh.nix
    ./themes.nix
    ./vesktop.nix
    ./yazi.nix
  ];

  home.stateVersion = "26.05";
}
