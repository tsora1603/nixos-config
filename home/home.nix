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

    # KDE Theme parts
    # Colors
    ".local/share/color-schemes/".source =
      link "${home}/nixos/themes/kde/colors";
    # Plasma Styles
    ".local/share/plasma/desktoptheme/".source =
      link "${home}/nixos/themes/kde/plasma-styles";
    # Window Decorations
    ".local/share/kwin/decorations/".source =
      link "${home}/nixos/themes/kde/window-decorations";
    # Cursors
    ".local/share/icons/".source =
      link "${home}/nixos/themes/kde/cursors";
    # Splash Screen / Global
    ".local/share/plasma/look-and-feel/".source =
      link "${home}/nixos/themes/kde/global";
  };

  programs.onlyoffice.enable = true;
  programs.vscodium.enable = true;
}
