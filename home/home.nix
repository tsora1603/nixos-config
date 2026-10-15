{ pkgs, ... }:

let
  win95 = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/ricewind012/win95-themes/"
      + "fbabefb43f7607612bf5f0df93bd3999c17c1de4/dist/steam.css";
    hash = "sha256-GRZ/EP+4CcCOYvHbjm/XcLGuTyT9fxIZt5DzC5binaM=";
  };

  steamTheme = pkgs.runCommand "plasma-overdose-cream-steam" { } ''
    mkdir -p "$out"
    cp -r ${../themes/steam/PlasmaOverdoseCream}/. "$out/"
    chmod -R u+w "$out"

    cp ${win95} "$out/upstream-win95.css"

    substituteInPlace "$out/steam_import.css" \
      --replace-fail \
      'https://rawcdn.githack.com/ricewind012/win95-themes/fbabefb43f7607612bf5f0df93bd3999c17c1de4/dist/steam.css' \
      'upstream-win95.css'
  '';
in
{
  home.file = {
    "Pictures/Wallpapers".source = ../wallpapers;

    "Documents/Themes/Hydra".source =
      ../themes/hydralauncher;

    ".steam/steam/millennium/themes/PlasmaOverdoseCream".source =
      steamTheme;

    ".config/vesktop/themes/PlasmaOverdoseCream-Vesktop.css".source =
      ../themes/vesktop/PlasmaOverdoseCream-Vesktop.css;
  };

  programs.onlyoffice.enable = true;
  programs.vscodium.enable = true;
}
