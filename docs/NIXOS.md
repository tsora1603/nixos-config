# The system side

[`configuration.nix`](../configuration.nix) is the entry point. It imports the
hardware configuration, Flatpak declarations and the modules below. Shared Nix
settings and `system.stateVersion` stay in this file.

| Module | What it configures |
| --- | --- |
| [`boot.nix`](../modules/boot.nix) | systemd-boot, CachyOS kernel, binary cache and ntsync |
| [`desktop.nix`](../modules/desktop.nix) | Plasma, SDDM, Qylock, graphics acceleration, fonts and Flatpak integration |
| [`hardware.nix`](../modules/hardware.nix) | PipeWire audio, Bluetooth, firmware updates and power management |
| [`system.nix`](../modules/system.nix) | Hostname, networking, locale, keyboard layout and backup SSD mount |
| [`users.nix`](../modules/users.nix) | User account, Fish and Home Manager integration |
| [`gaming.nix`](../modules/gaming.nix) | Millennium and lsfg-vk overlays, Steam and AppImage support |
| [`packages.nix`](../modules/packages.nix) | System applications and the separate unstable package set |

Each file is a NixOS module, so settings are merged when the system is evaluated.
`inputs` is available through the flake's `specialArgs`. Relative paths resolve
from the file containing them; for example, `users.nix` imports
`../home/default.nix`.

## Applications and Flatpaks

Add system packages to `modules/packages.nix`. Within its `with pkgs` list,
`vlc` uses stable Nixpkgs while `unstable.vlc` selects the unstable version.
Replace the existing entry when switching a package between the two.
User application configuration lives under `home/`.

[`flatpaks.nix`](../flatpaks.nix) declares the Flatpak applications and enables weekly
updates. Manually installed Flatpaks are preserved.

Flatpak updates happen independently of `flake.lock`, so their versions
aren’t pinned in the same way as the Nix dependencies.
