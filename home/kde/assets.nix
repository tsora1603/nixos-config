{ pkgs, ... }:

let
  archive = repo: rev: hash:
    pkgs.fetchurl {
      url = "https://codeload.github.com/${repo}/tar.gz/${rev}";
      inherit hash;
    };

  pixora = archive
    "tsora1603/pixora-icons"
    "dd3911a3f8c56c226656db25b81e3e679ccda270"
    "sha256-lZHfKW0co8XY0d0nrDdldVyxbldMlvj6uiLkoF0E5us=";

  ntLegacy = archive
    "huppiflupp/nt-legacy"
    "89465483f05f25b906a216e93e7708a274f56ae9"
    "sha256-71ChAPI8i0QHDBqT+ubEtTB5iUO9euFh96oaldnbmNk=";

  overdose = archive
    "Notify-ctrl/Plasma-Overdose"
    "2ca54efdeef230277294a04b0124c5572a16de0b"
    "sha256-a/oFeWP+BCvsfnNidLTA3Eoj0Qw3TjBPJjWmTtfSMGY=";

  themes = pkgs.runCommand "tsora-desktop-themes" { } ''
    mkdir pixora nt overdose
    tar -xzf ${pixora} --strip-components=1 -C pixora
    tar -xzf ${ntLegacy} --strip-components=1 -C nt
    tar -xzf ${overdose} --strip-components=1 -C overdose

    mkdir -p "$out/share/"{icons,plasma,aurorae/themes,kwin/decorations,wallpapers}

    cp -r pixora/pixora pixora/pixora-dark pixora/pixora-accent \
      "$out/share/icons/"

    cp -r nt/nt-legacy/color-schemes "$out/share/"
    cp -r nt/nt-legacy/look-and-feel nt/nt-legacy/desktoptheme \
      "$out/share/plasma/"
    cp -r nt/nt-legacy/aurorae/. "$out/share/aurorae/themes/"
    cp -r nt/nt-legacy/icons-nt/. "$out/share/icons/"
    cp -r nt/nt-legacy/cursors/. "$out/share/icons/"
    cp -r nt/nt-legacy/wallpapers/. "$out/share/wallpapers/"

    cp -r overdose/kwin/Plasma-Overdose-KWinDeco \
      "$out/share/kwin/decorations/"
  '';
in
{
  home.packages = [ themes ];

  xdg.dataFile."icons/Plasma-Overdose-Cream".source =
    ../../themes/kde/cursors/Plasma-Overdose-Cream-cursor;
}
