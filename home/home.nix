{ config, ... }:
let
  home = config.home.homeDirectory;
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file = {
    "Pictures/Wallpapers".source =
      link "${home}/nixos/wallpapers";
  
    "Documents/Themes/PlasmaOverdoseCream-Hydra.css".source =
      link "${home}/nixos/themes/hydralauncher/PlasmaOverdoseCream-Hydra.css";

    ".steam/steam/millennium/themes".source =
      link "${home}/nixos/themes/steam";

    ".config/vesktop/themes".source = 
      link "${home}/nixos/themes/vesktop";
  };

  programs.onlyoffice.enable = true;
  programs.vscodium.enable = true;
}
