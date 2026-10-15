# KDE: organized by what you want to change

[`home/kde/default.nix`](../home/kde/default.nix) imports the desktop modules. 
Most preferences live under [`home/kde/plasma-modules/`](../home/kde/plasma-modules):

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
module rather than relying on KDE's System Settings.

## Window management

KWin handles the desktop, window rules and focus-following-the-mouse
behavior, while Karousel tries to implement a scrolling tiling layout.

The rules near the top of [`karousel.nix`](..home/kde/plasma-modules/karousel.nix) 
decide which applications float. Small utilities, Dolphin and Ghostty are examples of floating
exceptions. Rules can match either an application’s `window class` or its `title`.

## The floating-panel patch

[`floating-panel.nix`](..home/kde/floating-panel.nix) 
connects the [panel patch](https://github.com/illatillmods/plasma-always-floating-panel-patch) 
*(a bit modified for my setup)* to Home Manager and systemd user services.

The patch keeps panels floating when windows touch them and adjusts
their reserved space so maximized windows don’t sit underneath them.
It also installs a multi-monitor resize-snapping workaround.

It modifies a **user-local copy of the Plasma shell** package (check that on `.local/share/plasma/shells/org.kde.plasma.desktop/`). A systemd service refreshes that copy before Plasma starts, and another handles panel adjustments after startup.

Log out and back in after changing this part of the configuration.