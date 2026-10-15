# Karousel window rules, plugin settings, and all Karousel keyboard shortcuts.
# Edit karouselWindowRules near the top to add or change window rules.
let
  # ──────────────────────────────────────────────────────────────────
  # Karousel window rules — EDIT HERE
  # ──────────────────────────────────────────────────────────────────
  # Match by window class (regular expression). First matching rule can
  # matter, so keep the order when adding rules or exceptions.
  #
  #   (float "firefox")                     Never tile Firefox
  #   (tile "org.kde.kate")                 Always tile Kate
  #   (floatTitle "steam" "Big Picture")    Float matching Steam title
  #   (tileTitle "example" "Settings")      Tile matching window title
  #
  # To match a literal dot in a class, use two slashes: "org\\.kde\\.dolphin".
  float = class: { inherit class; tile = false; };
  tile = class: { inherit class; tile = true; };
  floatTitle = class: caption: { inherit class caption; tile = false; };
  tileTitle = class: caption: { inherit class caption; tile = true; };

  karouselWindowRules = [
    (float "(org\\.kde\\.)?plasmashell")
    (float "(org\\.kde\\.)?polkit-kde-authentication-agent-1")
    (float "(org\\.kde\\.)?kded6")
    (float "(org\\.kde\\.)?kcalc")
    (tile "(org\\.kde\\.)?kfind")
    (float "(org\\.kde\\.)?kruler")
    (float "(org\\.kde\\.)?krunner")
    (float "(org\\.kde\\.)?yakuake")
    (float "(org\\.kde\\.)?dolphin")
    (float "(org\\.kde\\.)?spectacle")
    (float "systemsettings")
    (floatTitle "steam" "Steam Big Picture Mode")
    (floatTitle "zoom" "Zoom Cloud Meetings|zoom|zoom <2>")
    (floatTitle "jetbrains-.*" "splash")
    (tileTitle "jetbrains-.*" "Unstash Changes|Paths Affected by stash@.*")
    (float "com.mitchellh.ghostty")
    (float "org.freedesktop.impl.portal.desktop.kde")
  ];
in
{
  programs.plasma = {
    shortcuts = {
      kwin = {
        # 05  Karousel — focus
        karousel-focus-1 = [ ];
        karousel-focus-10 = [ ];
        karousel-focus-11 = [ ];
        karousel-focus-12 = [ ];
        karousel-focus-2 = [ ];
        karousel-focus-3 = [ ];
        karousel-focus-4 = [ ];
        karousel-focus-5 = [ ];
        karousel-focus-6 = [ ];
        karousel-focus-7 = [ ];
        karousel-focus-8 = [ ];
        karousel-focus-9 = [ ];
        karousel-focus-down = "Meta+Down";
        karousel-focus-end = [ ];
        karousel-focus-left = "Meta+Left";
        karousel-focus-next = [ ];
        karousel-focus-previous = [ ];
        karousel-focus-right = "Meta+Right";
        karousel-focus-start = [ ];
        karousel-focus-up = "Meta+Up";
        # 06  Karousel — windows
        karousel-window-move-down = "Meta+Shift+Down";
        karousel-window-move-end = "Meta+Shift+End";
        karousel-window-move-left = "Meta+Shift+Left";
        karousel-window-move-next = [ ];
        karousel-window-move-previous = [ ];
        karousel-window-move-right = "Meta+Shift+Right";
        karousel-window-move-start = "Meta+Shift+Home";
        karousel-window-move-to-column-1 = "Meta+Shift+1";
        karousel-window-move-to-column-10 = [ ];
        karousel-window-move-to-column-11 = [ ];
        karousel-window-move-to-column-12 = [ ];
        karousel-window-move-to-column-2 = "Meta+Shift+2";
        karousel-window-move-to-column-3 = "Meta+Shift+3";
        karousel-window-move-to-column-4 = "Meta+Shift+4";
        karousel-window-move-to-column-5 = "Meta+Shift+5";
        karousel-window-move-to-column-6 = "Meta+Shift+6";
        karousel-window-move-to-column-7 = "Meta+Shift+7";
        karousel-window-move-to-column-8 = "Meta+Shift+8";
        karousel-window-move-to-column-9 = "Meta+Shift+9";
        karousel-window-move-up = "Meta+Shift+Up";
        karousel-window-toggle-floating = "Meta+Space";
        # 07  Karousel — columns
        karousel-column-move-end = "Meta+End";
        karousel-column-move-left = [ ];
        karousel-column-move-right = [ ];
        karousel-column-move-start = "Meta+Home";
        karousel-column-move-to-column-1 = "Meta+Ctrl+Shift+1";
        karousel-column-move-to-column-10 = [ ];
        karousel-column-move-to-column-11 = [ ];
        karousel-column-move-to-column-12 = [ ];
        karousel-column-move-to-column-2 = "Meta+Ctrl+Shift+2";
        karousel-column-move-to-column-3 = "Meta+Ctrl+Shift+3";
        karousel-column-move-to-column-4 = "Meta+Ctrl+Shift+4";
        karousel-column-move-to-column-5 = "Meta+Ctrl+Shift+5";
        karousel-column-move-to-column-6 = "Meta+Ctrl+Shift+6";
        karousel-column-move-to-column-7 = "Meta+Ctrl+Shift+7";
        karousel-column-move-to-column-8 = "Meta+Ctrl+Shift+8";
        karousel-column-move-to-column-9 = "Meta+Ctrl+Shift+9";
        karousel-column-move-to-desktop-1 = "Meta+1";
        karousel-column-move-to-desktop-10 = "Meta+0";
        karousel-column-move-to-desktop-11 = "Meta+Ctrl+Shift+F11";
        karousel-column-move-to-desktop-12 = "Meta+Ctrl+Shift+F12";
        karousel-column-move-to-desktop-2 = "Meta+2";
        karousel-column-move-to-desktop-3 = "Meta+3";
        karousel-column-move-to-desktop-4 = "Meta+4";
        karousel-column-move-to-desktop-5 = "Meta+5";
        karousel-column-move-to-desktop-6 = "Meta+6";
        karousel-column-move-to-desktop-7 = "Meta+7";
        karousel-column-move-to-desktop-8 = "Meta+8";
        karousel-column-move-to-desktop-9 = "Meta+9";
        karousel-column-toggle-stacked = "Meta+X";
        karousel-column-width-decrease = "Meta+Ctrl+-";
        karousel-column-width-increase = "Meta+Ctrl++";
        karousel-columns-squeeze-left = [ ];
        karousel-columns-squeeze-right = "Meta+Ctrl+D";
        karousel-columns-width-equalize = [ ];
        # 08  Karousel — scrolling, screens, and desktops
        karousel-cycle-preset-widths = "Meta+R";
        karousel-cycle-preset-widths-reverse = [ ];
        karousel-grid-scroll-end = "Meta+Alt+End";
        karousel-grid-scroll-focused = "Meta+Alt+Return";
        karousel-grid-scroll-left = "Meta+Alt+PgUp";
        karousel-grid-scroll-left-column = "Meta+Alt+A";
        karousel-grid-scroll-right = "Meta+Alt+PgDown";
        karousel-grid-scroll-right-column = "Meta+Alt+D";
        karousel-grid-scroll-start = "Meta+Alt+Home";
        karousel-screen-switch = "Meta+Ctrl+Return";
        karousel-tail-move-to-desktop-1 = "Meta+Ctrl+Alt+Shift+F1";
        karousel-tail-move-to-desktop-10 = "Meta+Ctrl+Alt+Shift+F10";
        karousel-tail-move-to-desktop-11 = "Meta+Ctrl+Alt+Shift+F11";
        karousel-tail-move-to-desktop-12 = "Meta+Ctrl+Alt+Shift+F12";
        karousel-tail-move-to-desktop-2 = "Meta+Ctrl+Alt+Shift+F2";
        karousel-tail-move-to-desktop-3 = "Meta+Ctrl+Alt+Shift+F3";
        karousel-tail-move-to-desktop-4 = "Meta+Ctrl+Alt+Shift+F4";
        karousel-tail-move-to-desktop-5 = "Meta+Ctrl+Alt+Shift+F5";
        karousel-tail-move-to-desktop-6 = "Meta+Ctrl+Alt+Shift+F6";
        karousel-tail-move-to-desktop-7 = "Meta+Ctrl+Alt+Shift+F7";
        karousel-tail-move-to-desktop-8 = "Meta+Ctrl+Alt+Shift+F8";
        karousel-tail-move-to-desktop-9 = "Meta+Ctrl+Alt+Shift+F9";
      };
    };
    configFile = {
      kwinrc = {
        Plugins.karouselEnabled = true;
        Script-karousel = {
          gapsInnerHorizontal = 16;
          gapsInnerVertical = 16;
          reMaximize = true;
          resizeNeighborColumn = true;
          skipSwitcher = true;
          stackOffsetX = 16;
          stackOffsetY = 16;
          # Rules are defined above as a normal Nix list. Add a new `(float "app")`
          # or `(tile "app")` there; no JSON escaping required.
          windowRules = builtins.toJSON karouselWindowRules;
        };
      };
    };
  };
}
