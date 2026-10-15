# Plasma Overdose Cream · Pixel95 — Steam / Millennium

**Version 3.0.1 — Hydra visual parity edition**

A Steam skin made to closely match the companion **PlasmaOverdoseCream-Hydra.css** theme, using the same cream-and-brown Windows 95 / Needy Girl Overdose design language. This is an update of the supplied Steam theme, preserving its Windows 95 base and compatibility with your NixOS + KDE/KWin setup.

**v3.0.1 fix:** Removed duplicate inset/outer borders on Steam library collection and sorting dropdown selectors while keeping one Win95 bevel.

## Visual system

| Element | Color |
|---|---|
| Main paper | `#f0ece0` |
| Taupe application panels | `#d8d0c0` |
| Raised controls | `#e4dfd1` |
| Highlights / light bevels | `#fffaf1` |
| Warm brown borders | `#96703a` |
| Deep brown titlebar / selected rows | `#7d6036` |
| Orange focus / progress accents | `#c87922` |
| Dark ink | `#202628` |

- Brown vertically striped Steam navigation, library shelf bars, side panels, and game-section headers, borrowing the **same** pattern as Hydra.
- Square beige buttons with layered light/dark pixel bevels, physical pressed states, and orange hover borders.
- Dark, readable labels on cream surfaces; ivory labels on striped dark-brown headers.
- Sunken input controls and progress tracks; striped orange progress fills.
- Pixel-outlined game covers and collection tiles. **Game artwork, avatars, video, and covers remain unfiltered.**
- Warm cream right-click menus, popups and tooltips, selected game rows, profile/friends headers and, where Steam selectors allow, notification toasts.
- `DepartureMono Nerd Font` with local/system fontconfig and monospace fallback. **No font files are bundled.**
- Steam's native status colors for friends and critical errors are preserved.

## Install on your NixOS + Home Manager configuration

Your existing declarative mapping is compatible with this archive:

```nix
home.file.".steam/steam/millennium/themes/PlasmaOverdoseCream".source =
  config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos/themes/steam/PlasmaOverdoseCream";
```

If your `~/nixos/themes/steam/PlasmaOverdoseCream` directory already exists, **back up its contents**, then overwrite only these files with the files from this archive:

```text
PlasmaOverdoseCream/
├── README.md
├── skin.json
├── steam_import.css
└── src/
    └── steam/
        └── steam.js
```

The directory name and `skin.json` metadata are maintained, so Millennium can continue recognizing your existing theme. **You do not need `nh os switch` after editing files inside the already linked directory**: out-of-store directory symlinks expose the updated files immediately. In Steam, reload the Millennium theme or fully restart Steam to apply the CSS.

If instead you install manually, place the `PlasmaOverdoseCream` folder at `~/.steam/steam/millennium/themes/PlasmaOverdoseCream/` (for this Steam installation) and select **Plasma Overdose Cream · Pixel95** in Millennium.

## Required font

Install DepartureMono via NixOS if you have not already:

```nix
fonts.packages = with pkgs; [ nerd-fonts.departure-mono ];
```

Check with `fc-match -f '%{family}\n' 'DepartureMono Nerd Font'`.

## Structure and customization

- `steam_import.css` is the main theme. **§01** holds the palette; **§14–27** provides specific overrides inspired by Hydra. For consistent results, edit the colors in §01 and adjust the `--ngo-header-stripes` variable in §14 if changing your palette.
- `skin.json` contains Millennium's existing three window patches for desktop, other Steam windows, and Friends.
- `src/steam/steam.js` is **unchanged** from the supplied theme; only the CSS and descriptive metadata are updated.
- The theme still uses the pinned Windows 95 upstream base from [`ricewind012/win95-themes`](https://github.com/ricewind012/win95-themes), imported over HTTPS at the top of `steam_import.css`. Its stylesheet must be accessible when Steam loads the theme. No extra JavaScript or executable dependencies were introduced.

### KDE native titlebar

The prior behavior is retained: Steam's duplicated Win95 caption and client-side min/max/close controls are hidden for the main desktop window so your KDE/KWin decoration can provide them. The Steam/View/Friends menu, main Steam navigation, and account controls are preserved. It doesn't *enable* KWin decorations, and it doesn't attempt to change popup titlebars or the game overlay.

### Compatibility limits

Steam and Hydra have different page structures: CSS can reproduce the palette, pixel typography, bevels, panel chrome and states, but it cannot make all layouts or behaviors literally identical. Steam's generated CSS module classes can change after updates. Targeted selectors are used to keep the design reasonably resilient. Custom CSS can't style proprietary webpage contents (store/community web content) unless a separate Millennium patch targets those web views; this package intentionally preserves its original window patch scope.

**Checks:** CSS syntax, JSON validity, JavaScript syntax and archive structure are verified. Visual behavior requires testing in your installed Steam client. Please send screenshots of any panel whose text or borders still look wrong.

## Credits

- Windows 95 base: [ricewind012/win95-themes](https://github.com/ricewind012/win95-themes)
- Design reference: *Plasma Overdose Cream / Pixel95* Hydra theme and *Needy Girl Overdose*

### Dropdown cleanup

This revision corrects a broad `DialogDropDown` match that unintentionally styled individual option rows and current-value labels with full input borders. The new rule targets the actual dropdown control and leaves the menu rows flat while preserving the selection highlight.

## Game details contrast update (3.0.2)

Improved contrast for Last Launched / Usage Time, Friends, Notes, Recordings and Screenshots, and Activity captions using the Steam appdetailsplaysection and appdetailssectionheader controls. Existing dropdown fixes and the Steam library structure are retained.

## 3.0.3 contrast correction

Steam game-detail captions and section names now receive dark ink on light panels. This revision also overrides nested inline label colors and parent opacity, and avoids restricting the new rules to a `.DesktopUI` ancestor. Game image content is unchanged. Test this in Steam after a complete restart; older client CSS module names can differ.
