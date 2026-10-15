# NixOS configuration

My personal NixOS configuration, using NixOS 26.05, Home Manager and Plasma Manager.

## Validate

```sh
nix flake check --no-build --no-write-lock-file
nix build --no-link --no-write-lock-file .#tidaler
```

The first command evaluates the configuration. The second builds
Tidaler and runs its CLI and offscreen GUI smoke checks.

## Apply

Review hardware-configuration.nix before using this on another machine.

```sh
sudo nixos-rebuild test --flake .#hephaestus
sudo nixos-rebuild switch --flake .#hephaestus
```

Log out and back in after changing the floating-panel patch.

## Layout
```
.
├── configuration.nix
├── flake.lock
├── flake.nix
├── flatpaks.nix
├── hardware-configuration.nix
├── home
│   ├── default.nix
│   ├── fastfetch
│   │   ├── config.jsonc
│   │   ├── cpu-temp-icon.sh
│   │   ├── gpu-temp-icon.sh
│   │   └── pipe.txt
│   ├── fastfetch.nix
│   ├── fish
│   │   └── functions
│   │       ├── fish_prompt.fish
│   │       └── fish_right_prompt.fish
│   ├── fish.nix
│   ├── ghostty.nix
│   ├── git.nix
│   ├── home.nix
│   ├── kde
│   │   ├── assets.nix
│   │   ├── default.nix
│   │   ├── floating-panel.nix
│   │   ├── plasma-modules
│   │   │   ├── appearance.nix
│   │   │   ├── applications.nix
│   │   │   ├── default.nix
│   │   │   ├── input.nix
│   │   │   ├── karousel.nix
│   │   │   ├── kwin.nix
│   │   │   ├── services.nix
│   │   │   ├── shortcuts.nix
│   │   │   └── wallpapers.nix
│   │   └── wallpaper-hot-reload.nix
│   ├── shell.nix
│   ├── ssh.nix
│   ├── vesktop.nix
│   └── yazi.nix
├── packages
│   └── tidaler.nix
├── README.md
├── scripts
│   └── plasma-always-floating-panel-patch
├── tests
│   └── tidaler-smoke.py
├── themes
│   ├── hydralauncher
│   │   ├── floraphonic-classic-game-action-positive-1-224407.mp3
│   │   └── PlasmaOverdoseCream-Hydra.css
│   ├── kde
│   │   ├── colors
│   │   │   └── PlasmaOverdoseCream.colors
│   │   ├── cursors
│   │   │   └── Plasma-Overdose-Cream-cursor
│   │   ├── global
│   │   │   └── Plasma Overdose - Cream
│   │   ├── plasma-styles
│   │   │   └── Plasma-Overdose-Classic
│   │   └── window-decorations
│   │       └── Plasma-Overdose-KWinDeco
│   ├── steam
│   │   └── PlasmaOverdoseCream
│   └── vesktop
│       └── PlasmaOverdoseCream-Vesktop.css
└── wallpapers
    ├── MONITOR1
    │   ├── Astral_Grave
    │   ├── Cats
    │   ├── Frieren
    │   ├── HollowKnight
    │   └── PixelArt
    └── MONITOR2
        ├── Frieren
        ├── Hollow-Knight
        ├── Permanent
        └── PixelArt
```
- configuration.nix: system services and packages
- hardware-configuration.nix: machine-specific storage and hardware
- home/: user applications, shell and desktop settings
- packages/: locally maintained packages
- themes/ and wallpapers/: assets installed through Home Manager

Assets are copied into the Nix store; changes require a rebuild.

Theme downloads are pinned by revision and hash. Steam's base
stylesheet is bundled at build time and needs no runtime download.

Manually installed Flatpaks are preserved.

Do not bump `system.stateVersion` or `home.stateVersion` as part of
routine package updates.
