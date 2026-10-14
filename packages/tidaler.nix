# Local, Nix-native package for Tidaler 0.1.8 with Qt6 GUI support.
# Add to environment.systemPackages with:
#   (import ./pkgs/tidaler.nix { inherit pkgs; })
{ pkgs }:
let
  py = pkgs.python313Packages;

  # Tidaler depends on the newer fork of PyQtDarkTheme, which is not in
  # this nixpkgs revision. It provides the `qdarktheme` Python module.
  pyqtdarktheme-fork = py.buildPythonPackage rec {
    pname = "pyqtdarktheme-fork";
    version = "2.3.6";
    pyproject = true;

    src = pkgs.fetchPypi {
      pname = "pyqtdarktheme_fork";
      inherit version;
      hash = "sha256-mrKHoDOkdCdnvLZpj7YCR77veWfXTrlJ96s27oZv8dc=";
    };

    build-system = [ py.poetry-core ];
    dependencies = [ py.darkdetect ];
    pythonImportsCheck = [ "qdarktheme" ];
    doCheck = false;
  };
in
py.buildPythonApplication rec {
  pname = "tidaler";
  version = "0.1.8";
  pyproject = true;

  src = pkgs.fetchPypi {
    inherit pname version;
    hash = "sha256-Ixv3PS8kohTV5JS34bMGrv1Be7rScFvnyja1T9jrl6s=";
  };

  build-system = [ py.poetry-core ];

  dependencies = (with py; [
    ansi2html
    coloredlogs
    dataclasses-json
    m3u8
    mutagen
    pathvalidate
    pycryptodome
    pyside6
    python-ffmpeg
    requests
    rich
    tidalapi
    toml
    typer
  ]) ++ [ pyqtdarktheme-fork ];

  # Tidaler 0.1.8 constrains requests <2.33 and typer <0.21, whereas
  # this nixpkgs revision has newer versions. Relax the metadata bounds
  # rather than downgrading requests to a version with a known 2026 CVE.
  # Runtime compatibility with the newer versions still needs testing.
  pythonRelaxDeps = [ "requests" "typer" ];

  nativeBuildInputs = [
    pkgs.qt6.wrapQtAppsHook
    pkgs.copyDesktopItems
  ];
  buildInputs = [
    pkgs.qt6.qtbase
    pkgs.qt6.qtwayland
  ];

  # Python's wrapper must incorporate the Qt6 environment; don't wrap twice.
  dontWrapQtApps = true;
  preFixup = ''
    makeWrapperArgs+=("''${qtWrapperArgs[@]}")
    makeWrapperArgs+=(--prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.ffmpeg ]})
  '';

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "tidaler";
      desktopName = "Tidaler";
      comment = "TIDAL downloader";
      exec = "tidaler-gui";
      icon = "audio-x-generic";
      categories = [ "AudioVideo" "Audio" "Network" ];
      terminal = false;
    })
  ];

  # Upstream tests may need network/authentication, which Nix builds lack.
  doCheck = false;
  pythonImportsCheck = [ "tidaler" ];

  meta = with pkgs.lib; {
    description = "TIDAL downloader with CLI and PySide6 GUI";
    homepage = "https://github.com/maya-doshi/tidaler";
    license = licenses.agpl3Only;
    platforms = platforms.linux;
    mainProgram = "tidaler";
  };
}
