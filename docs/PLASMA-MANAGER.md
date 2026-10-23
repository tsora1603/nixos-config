# KDE: Modularized

[`home/kde/default.nix`](../home/kde/default.nix) imports the desktop modules. 
Most preferences live under [`home/kde/plasma-modules/`](../home/kde/plasma-modules):

| File | What to change there |
| --- | --- |
| `appearance.nix` | Fonts, icons, accent colors, splash screen and terminal preference |
| `input.nix` | Keyboard layout, mouse settings and cursor theme |
| `kwin.nix` | Focus behavior, window rules and native tiling layouts |
| `shortcuts.nix` | Native KWin window actions, desktop and application shortcuts |
| `applications.nix` | Dolphin, Kate, Spectacle and file dialog preferences |
| `services.nix` | Miscellaneous desktop service settings |
| `wallpapers.nix` | Desktop and lock-screen wallpapers |

These modules use Plasma Manager to write KDE configuration files.
If you want a change to survive future rebuilds, put it in the relevant
module rather than relying on KDE's System Settings.

## Window management

KWin handles window rules, focus-following-the-mouse behavior and native tiling.
Monitor-specific tile layouts remain in
[`kwin.nix`](../home/kde/plasma-modules/kwin.nix), and window shortcuts live in
[`shortcuts.nix`](../home/kde/plasma-modules/shortcuts.nix).

| Shortcut | Native KWin action |
| --- | --- |
| Meta + arrows | Focus a window in that direction (Meta + Alt + arrows also works) |
| Meta + Shift + arrows | Move and resize the active window into the corresponding screen half (KWin Quick Tile) |
| Meta + Shift + Home / End | Move the active window left / right |
| Meta + Space | Toggle maximize (Meta + Page Up also works) |
| Meta + Ctrl + minus / plus | Shrink / expand the active window horizontally |
| Meta + R | Start interactive window resizing; confirm with Enter or cancel with Escape |
| Meta + Alt + Enter | Center the active window |
| Meta + Ctrl + Enter | Focus the next screen |
| Meta + 1–9 / 0 | Send the active window to desktop 1–9 / 10 |
| Meta + Ctrl + Shift + F11 / F12 | Send the active window to desktop 11 / 12 |

Meta alone opens the existing Search widget (`org.kde.milou`, widget 485 in
containment 428). Both its global action and its own `Shortcuts/global` setting
are declared in `shortcuts.nix`. If the widget is recreated, update these IDs.

Desktop transfers affect the active window and require the destination desktop
to exist; the configuration currently declares one desktop.

## The floating-panel patch

[`floating-panel.nix`](..home/kde/floating-panel.nix) 
connects the [panel patch](https://github.com/illatillmods/plasma-always-floating-panel-patch) 
*(a bit modified for my setup)* to Home Manager and systemd user services.

The patch keeps panels floating when windows touch them and adjusts
their reserved space so maximized windows don’t sit underneath them.
It also installs a multi-monitor resize-snapping workaround.

It modifies a **user-local copy of the Plasma shell** package (check that on `.local/share/plasma/shells/org.kde.plasma.desktop/`). A systemd service refreshes that copy before Plasma starts, and another handles panel adjustments after startup.

Log out and back in after changing this part of the configuration.
