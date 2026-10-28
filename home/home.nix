{ ... }:

{
  xdg.configFile."btop/themes/plasma-overdose-cream.theme".source =
    ../themes/btop/plasma-overdose-cream.theme;

  home.file = {
    "Pictures/Wallpapers".source = ../wallpapers;

    "Documents/Themes/Hydra".source =
      ../themes/hydralauncher;

    ".steam/steam/millennium/themes/PlasmaOverdoseCream".source =
      ../themes/steam/PlasmaOverdoseCream;

    ".config/vesktop/themes/PlasmaOverdoseCream-Vesktop.css".source =
      ../themes/vesktop/PlasmaOverdoseCream-Vesktop.css;
  };

  # Install each local KDE component separately so other themes can coexist.
  xdg.dataFile = {
    "color-schemes/PlasmaOverdoseCream.colors".source =
      ../themes/kde/colors/PlasmaOverdoseCream.colors;

    "icons/Plasma-Overdose-Cream".source =
      ../themes/kde/cursors/Plasma-Overdose-Cream-cursor;

    "plasma/look-and-feel/PlasmaOverdoseCream".source =
      ../themes/kde/global + "/Plasma Overdose - Cream";

    "plasma/desktoptheme/Plasma-Overdose-Classic".source =
      ../themes/kde/plasma-styles/Plasma-Overdose-Classic;

    "kwin/decorations/Plasma-Overdose-KWinDeco".source =
      ../themes/kde/window-decorations/Plasma-Overdose-KWinDeco;
  };

  programs.onlyoffice.enable = true;
  programs.vscodium.enable = true;
  programs.prismlauncher.enable = true;
}
