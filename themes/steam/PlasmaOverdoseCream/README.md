# Plasma Overdose Cream · Pixel95 — DepartureMono Nerd Font (Millennium)

A Needy Girl Overdose-inspired, cream-first Steam theme based on the **original Windows 95 Millennium theme by ricewind012**. This is a separate theme, not an update layered over older custom Steam CSS.

## Design

- Original Win95 components, window shapes, menus, dialog layout and interactions are retained.
- Cream `#f0ece0`, taupe `#d8d0c0`, off-white, sand, warm brown `#96703a`, accent orange `#c87922`, charcoal `#202628`. **No pink or purple.**
- DepartureMono Nerd Font (locally installed through NixOS/fontconfig), with monospaced fallbacks. No font files are bundled and no font CDN is used. Normal UI text uses an 11px pixel grid.
- Pixel stripe title/nav and shelf headers, square/beveled buttons, stepped hover transitions, readable category labels and sidebar, sharp window/chrome borders, subtle pixel-art decorations.
- Targeted ink/muted color rules for Steam Library **What's New**, update cards, shelf headings, collection controls, labels and dates, avoiding pale-on-cream text.
- Game and collection artwork are **not recolored or pixelated**. The collection label is a light rectangular overlay to make its title readable.

## Required font (NixOS)

Install the font with your other declarative NixOS settings:

```nix
fonts.packages = with pkgs; [
  nerd-fonts.departure-mono
];
```

Run `nh os switch` and restart Steam. If you already define `fonts.packages`, simply append `nerd-fonts.departure-mono` rather than adding a duplicate declaration. Check availability with `fc-match -f '%{family}\n' 'DepartureMono Nerd Font'`.

## KDE native window titlebar (v2.1.3)

This version hides both Steam-owned titlebar elements: the internal minimize/maximize/close controls AND the decorative brown Win95 caption that says "Steam". The caption uses `.title-area`, a separate selector in the original Win95 base. The KDE/KWin native window decoration remains visible and provides those functions. Steam/View/Friends menus, Store/Library navigation, and notification/account controls are intentionally preserved.

This CSS **does not enable** KDE decorations; configure the native titlebar separately in KDE/your window rules as needed. This skin targets Steam's main desktop window, not separate popup windows or the game overlay. If your Steam version renders the menu bar inside `.title-area`, reload the earlier release and report a screenshot.

## Install

1. Fully exit Steam.
2. Extract ZIP into `~/.steam/steam/steamui/skins/`. Your result should be `skins/Plasma-Overdose-Cream-Pixel95/skin.json`.
3. Start Steam, select **Plasma Overdose Cream · Pixel95** in Millennium's theme selector, and reload the skin. Disable earlier Plasma Overdose Cream themes.
4. Test Steam Library Home (including What's New, collection and Favorites shelves), a collection page, a game page, Settings and Friends/Chat.

## Technical notes

- **Upstream:** https://github.com/ricewind012/win95-themes (2.3.0 base), pinned original stylesheet via the same CDN used by upstream. The original stylesheet requires network access for its CDN on first load.
- **Source of customization:** `steam_import.css`, organized into numbered sections. Edit `--ngo-*`/`--color-*` tokens in section 01 for colors. No external JavaScript. `src/steam/steam.js` remains from the upstream/base skin.
- DepartureMono Nerd Font is a separately installed system font. Add `fonts.packages = with pkgs; [ nerd-fonts.departure-mono ];` to NixOS, rebuild, and open a fresh Steam session. Verify with `fc-match -f '%{family}\n' 'DepartureMono Nerd Font'`. The theme never downloads font files.
- Steam's CSS module class names can change on Steam updates; the new rules match class name fragments and intentionally avoid overriding game art and artwork text.
- **Validation:** CSS parsed successfully and bundle structure checked, but this package has **not been tested inside a live Steam client**. Any selectors whose module names changed may need adjustments after visual testing.

## Credits

- Base: [ricewind012/win95-themes](https://github.com/ricewind012/win95-themes)
- Visual inspiration: *Needy Girl Overdose / Needy Streamer Overload* and Plasma Overdose Cream KDE
