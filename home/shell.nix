{ ... }:
{
  programs = {
    nh = {
      enable = true;
      flake = "/home/tsora/nixos";
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
      };
    };

    bash.enable = true;
    eza.enable = true;
    btop.enable = true;
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
