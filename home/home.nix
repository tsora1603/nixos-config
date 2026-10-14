{ config, ... }:
{
  home.file."Pictures/Wallpapers".source=
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos/wallpapers";

  programs.onlyoffice.enable = true;
  programs.vscodium.enable = true;
}
