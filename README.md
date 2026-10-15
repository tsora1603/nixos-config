# My NixOS config

My personal NixOS desktop config - heavily assisted by AI on the things I'm still learning. A setup of **KDE Plasma + a cream-brown pixel art aesthetic**.

It runs NixOS 26.05 with **Home Manager** for user settings and **Plasma Manager** for KDE configuration.

This is tailored to my hardware and preferences, but the modules should
make it fairly easy to find something you want to borrow.

## How it fits together

There are three main layers:

| Layer | What it handles |
| --- | --- |
| NixOS | Hardware, boot, users, networking, system services and packages |
| Home Manager | My applications, shell, dotfiles and files in my home directory |
| Plasma Manager | KDE preferences, shortcuts, window rules and wallpaper settings |

[`flake.nix`](https://github.com/tsora1603/nixos-config/blob/main/flake.nix) brings those layers together. It defines the `hephaestus`
system and its dependencies; `flake.lock` records their exact revisions.

The main package set follows NixOS 26.05. Zen Browser uses the separate
unstable input, while other inputs provide: <br>
`home-manager`; <br>
`plasma-manager`; <br>
`nix-flatpak` (for declarative flatpak managing); <br>
`millennium` (for Steam ricing); <br>
`qylock` (for beautiful `sddm` screens); <br>

## The system side

[`configuration.nix`](https://github.com/tsora1603/nixos-config/blob/main/configuration.nix) contains the machine-wide setup:

- Plasma 6 with SDDM and a Wayland login greeter
- NetworkManager, PipeWire audio and Bluetooth
- The latest kernel available in the selected package set
- Steam with Millennium, Flatpak and AppImage support
- System applications, fonts and utilities

## How Home Manager works here

Home Manager is included as a NixOS module. That means rebuilding the
system also applies the configuration for the user; there
isn’t a separate Home Manager command to remember.

[`home/default.nix`](https://github.com/tsora1603/nixos-config/blob/main/home/default.nix) is the entry point. It imports smaller modules such
as `fish.nix`, `ghostty.nix`, `git.nix`, and the KDE directory.

Each module owns a particular part of the setup. For example:

- `fish.nix` defines aliases, abbreviations and prompt configuration.
- `ghostty.nix` configures the terminal and its matching color palette.
- `ssh.nix` configures the GitHub SSH identity and starts an SSH agent.
- `home.nix` installs wallpapers and application theme files.

Home Manager generates files and links them into the expected places
under the home directory. Conflicting unmanaged files get a
[`.before-declarative`](https://github.com/tsora1603/nixos-config/blob/1ba03621ae29173eb9c268ec1cd78f035ff26a29/configuration.nix#L40) backup rather than being silently overwritten.

## KDE: organized by what you want to change

[`home/kde/default.nix`](https://github.com/tsora1603/nixos-config/blob/main/home/default.nix) imports the desktop modules. 
Most preferences live under [`home/kde/plasma-modules/`](https://github.com/tsora1603/nixos-config/tree/main/home/kde/plasma-modules):

| File | What to change there |
| --- | --- |
| `appearance.nix` | Fonts, icons, accent colors, splash screen and terminal preference |
| `input.nix` | Keyboard layout, mouse settings and cursor theme |
| `kwin.nix` | Focus behavior, window rules and native tiling layouts |
| `karousel.nix` | Scrolling tiling, floating exceptions and Karousel shortcuts |
| `shortcuts.nix` | General desktop and application shortcuts |
| `applications.nix` | Dolphin, Kate, Spectacle and file dialog preferences |
| `services.nix` | Miscellaneous desktop service settings |
| `wallpapers.nix` | Desktop and lock-screen wallpapers |

These modules use Plasma Manager to write KDE configuration files.
If you want a change to survive future rebuilds, put it in the relevant
module rather than relying only on KDE's System Settings.

### Window management

KWin handles the desktop, window rules and focus-following-the-mouse
behavior. Karousel adds scrolling tiling.

The rules near the top of [`karousel.nix`](https://github.com/tsora1603/nixos-config/blob/main/home/kde/plasma-modules/karousel.nix) 
decide which applications
float. Small utilities, Dolphin and Ghostty are examples of floating
exceptions. Rules can match either an application’s window class or
its title.

### The floating-panel patch

[`floating-panel.nix`](https://github.com/tsora1603/nixos-config/blob/main/home/kde/floating-panel.nix) 
connects the [panel patch](https://github.com/illatillmods/plasma-always-floating-panel-patch) 
*(a bit modified for my setup)* to Home Manager and systemd user services.

The patch keeps panels floating when windows touch them and adjusts
their reserved space so maximized windows don’t sit underneath them.
It also installs a multi-monitor resize-snapping workaround.

It modifies a **user-local copy of the Plasma shell** package (check that on `.local/share/plasma/shells/org.kde.plasma.desktop/`). A service
refreshes that copy before Plasma starts, and another handles panel
adjustments after startup.

Log out and back in after changing this part of the configuration.

## How the themes work

Installing theme assets and selecting them are separate steps.

`themes/` is the source for my custom themes. Nothing downloads or
rewrites an upstream theme during the Nix build.

`home/home.nix` links the local cream color scheme, cursor,
global theme, Plasma style and KWin decoration into their individual
locations under `~/.local/share/`. It doesn't replace the parent theme
directories, so other installed themes can coexist.

The Plasma modules select my local `PlasmaOverdoseCream` global theme,
`Plasma-Overdose-Classic` Plasma style, cream color scheme, cursor,
splash screen and KWin decoration. The upstream Plasma Overdose theme
was a starting point; its original package and NT Legacy aren't installed.

Pixora remains the selected icon theme. Its Nix package is planned
separately; for now its files need to be installed already, since this
config doesn't include or download them.

### Application themes

`home/home.nix` places the matching themes where the applications
expect them:

| Application | Installed location |
| --- | --- |
| Steam / Millennium | `~/.steam/steam/millennium/themes/PlasmaOverdoseCream` |
| Vesktop | `~/.config/vesktop/themes/` |
| Hydra | `~/Documents/Themes/Hydra` |

Hydra, Steam and Vesktop use the files in `themes/hydralauncher/`,
`themes/steam/` and `themes/vesktop/` directly, without Nix substitutions
or downloaded theme builders. Their CSS is kept as written.

The checked-in Steam CSS still has its own remote Win95 `@import`.
That's part of the theme file, not an extra Nix download; loading that
base stylesheet still needs network access.

Placing the theme files doesn't select them inside each application.
In Hydra, import `~/Documents/Themes/Hydra/PlasmaOverdoseCream-Hydra.css`
in the appearance settings and enable it. Hydra stores imported CSS in
its own database, so re-import it after changing the file and rebuilding.
Select the matching local theme in Millennium and Vesktop as well.

## Wallpapers

The repository’s `wallpapers/` directory is installed at
`~/Pictures/Wallpapers`. The two monitor folders keep the collection
organized; the selected images are configured in `wallpapers.nix`.

`wallpaper-hot-reload.nix` attempts to apply wallpaper changes to a
running Plasma session during Home Manager activation.

Theme files and wallpapers are stored through Nix, so edit their
repository copies and rebuild to apply changes.

## Shell and everyday tools

Fish is my default shell, with a custom prompt showing the directory,
Git status, time and command results. Ghostty uses a matching cream
palette, while Yazi provides the terminal file manager.

The `ls`, `ll`, `la` and `lt` aliases use `eza`.

`shell.nix` also configures `nh` and scheduled cleanup with
`--keep-since 7d --keep 5`. Its flake path currently expects this
checkout at `/home/tsora/nixos`.

Fastfetch has its own configuration and CPU/GPU temperature helpers.
Those helpers target my AMD hardware and sensor names.

## Applications and Flatpaks

System applications live in `configuration.nix`; user application
configuration mostly lives under `home/`.

`flatpaks.nix` declares the Flatpak applications and enables weekly
updates. Manually installed Flatpaks are preserved.

Flatpak updates happen independently of `flake.lock`, so their versions
aren’t pinned in the same way as the Nix dependencies.

## The local Tidaler package

`packages/tidaler.nix` packages Tidaler with its Python dependencies,
Qt GUI support, FFmpeg and a desktop launcher.

Some dependency version bounds are relaxed to use the selected Nixpkgs
versions. The package therefore includes basic checks for CLI help,
version output, GUI imports and offscreen interface construction.

These catch common packaging problems. They don’t test TIDAL login
or authenticated downloads.

## Validate and apply

From the repository root:

```sh
# Evaluate the configuration without building the whole system
nix flake check --no-build --no-write-lock-file

# Build Tidaler and run its packaging checks
nix build --no-link --no-write-lock-file .#tidaler
```

The GitHub Actions workflow runs these checks too.

To try and then persist the system configuration:

```sh
sudo nixos-rebuild test --flake .#hephaestus
sudo nixos-rebuild switch --flake .#hephaestus
```

`test` activates the configuration without making it the boot default.
`switch` also makes it the default for subsequent boots.

If you’re adapting this setup, review the hardware configuration,
username, home paths, monitor-specific settings and SSH identity first.

Leave `system.stateVersion` and `home.stateVersion` alone during
routine updates: they control compatibility defaults, not package versions.

## Credits

This setup uses and builds on:

- NixOS, Home Manager and Plasma Manager
- KDE Plasma and Karousel
- Pixora icons
- Plasma Overdose by Notify-ctrl (the base for my local KDE theme)
- Millennium and ricewind012’s Win95 Steam theme
- Qylock
