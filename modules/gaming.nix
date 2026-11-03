{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.millennium.overlays.default
    inputs.lsfg-vk.overlays.default
  ];

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
  };

  programs.appimage = {
    enable = true;
    binfmt = true; # Allows launching .AppImage files directly.
  };
}
