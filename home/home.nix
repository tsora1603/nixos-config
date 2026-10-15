{ config, ... }:
let
  home = config.home.homeDirectory;
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file = {
    "Pictures/Wallpapers".source =
      link "${home}/nixos/wallpapers";
  
    "Documents/Themes/Hydra".source =
      link "${home}/nixos/themes/hydralauncher";

    ".steam/steam/millennium/themes/PlasmaOverdoseCream".source =
      link "${home}/nixos/themes/steam/PlasmaOverdoseCream";

    ".config/vesktop/themes/PlasmaOverdoseCream-Vesktop.css".source = 
      link "${home}/nixos/themes/vesktop/PlasmaOverdoseCream-Vesktop.css";
  };

  programs.onlyoffice.enable = true;
  programs.vscodium.enable = true;
}
