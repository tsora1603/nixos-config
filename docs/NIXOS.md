# The system side

[`configuration.nix`](https://github.com/tsora1603/nixos-config/blob/main/configuration.nix) contains the machine-wide setup:

- Plasma 6 with SDDM and a Wayland login greeter
- NetworkManager, PipeWire audio and Bluetooth
- The latest kernel available in the selected package set
- Steam with Millennium, Flatpak and AppImage support
- System applications, fonts and utilities

## Applications and Flatpaks

System applications live in `configuration.nix`; user application
configuration mostly lives under `home/`.

[`flatpaks.nix`](../flatpaks.nix) declares the Flatpak applications and enables weekly
updates. Manually installed Flatpaks are preserved.

Flatpak updates happen independently of `flake.lock`, so their versions
aren’t pinned in the same way as the Nix dependencies.

## The local Tidaler package

[`packages/tidaler.nix`](../packages/tidaler.nix) packages [Tidaler](https://github.com/maya-doshi/tidaler) 
with its Python dependencies, Qt GUI support, FFmpeg and a desktop launcher.

Some dependency version bounds are relaxed to use the selected Nixpkgs
versions. The package therefore includes basic checks for CLI help,
version output, GUI imports and offscreen interface construction.

These catch common packaging problems. They don’t test TIDAL login
or authenticated downloads.