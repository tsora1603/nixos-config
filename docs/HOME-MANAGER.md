# How Home Manager works

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
[`.before-declarative`](../configuration.nix#L40) backup rather than being silently overwritten.

## How the themes work

Installing theme assets and selecting them are separate steps:

- [`themes/`](../themes/) is the source for my custom themes.
- [`home/home.nix`](../home/home.nix) links the local cream color scheme, cursor,
global theme, Plasma style and KWin decoration into their individual
locations under `~/.local/share/`. It doesn't replace the parent theme
directories, so other installed themes can coexist.

The Plasma modules select my local `PlasmaOverdoseCream` global theme,
`Plasma-Overdose-Classic` Plasma style, cream color scheme, cursor,
splash screen and KWin decoration.

Pixora remains the selected icon theme. Its Nix package is planned
separately; for now its files need to be installed already, since this
config doesn't include or download them.

### Application themes

[`home/home.nix`](../home/home.nix) places the matching themes where the applications
expect them:

| Application | Installed location |
| --- | --- |
| Steam / Millennium | `~/.steam/steam/millennium/themes/PlasmaOverdoseCream` |
| Vesktop | `~/.config/vesktop/themes/` |
| Hydra | `~/Documents/Themes/Hydra` |

Hydra, Steam and Vesktop use the files in `themes/hydralauncher/`,
`themes/steam/` and `themes/vesktop/` directly, without Nix substitutions
or downloaded theme builders. Their CSS is kept as written.

Placing the theme files doesn't select them inside each application.
In Hydra Launcher, go to `Settings > General > Appearance` and copy-paste the contents of the .css file located in `~/Documents/Themes/Hydra/PlasmaOverdoseCream-Hydra.css` as a local theme and enable it.
Select the matching local theme in Millennium and Vesktop as well.

## Wallpapers

The repository’s [`wallpapers/`](../wallpapers/) directory is installed at
`~/Pictures/Wallpapers`. The two monitor folders keep the collection
organized; the selected images are configured in `wallpapers.nix`.

[`wallpaper-hot-reload.nix`](../home/kde/wallpaper-hot-reload.nix) attempts to apply wallpaper changes to a
running Plasma session during Home Manager activation.

## Shell and everyday tools

Fish is the default shell, with a custom prompt showing the directory,
Git status, time and command results. Ghostty uses a matching cream
palette, while Yazi provides the terminal file manager (still has to be tweaked for my taste).

The `ls`, `ll`, `la` and `lt` aliases use `eza`.

[`shell.nix`](../home/ssh.nix) also configures `nh` and scheduled cleanup with
`--keep-since 7d --keep 5`. Its flake path currently expects this
checkout at `/home/tsora/nixos`.

Fastfetch has its own configuration and CPU/GPU temperature helpers.
Those helpers target my AMD hardware and sensor names.