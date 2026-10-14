{ config, ... }:

let
  # This path stays valid through the Home Manager wallpaper symlink.
  lockWallpaper = "file://${config.home.homeDirectory}/Pictures/Wallpapers/MONITOR1/Astral_Grave/wallhaven-l8xwdp_3440x1440.png";

  # Preserve Karousel rules as structured Nix rather than escaped JSON.
  karouselRules = [
    { class = "(org\\.kde\\.)?plasmashell"; tile = false; }
    { class = "(org\\.kde\\.)?polkit-kde-authentication-agent-1"; tile = false; }
    { class = "(org\\.kde\\.)?kded6"; tile = false; }
    { class = "(org\\.kde\\.)?kcalc"; tile = false; }
    { class = "(org\\.kde\\.)?kfind"; tile = true; }
    { class = "(org\\.kde\\.)?kruler"; tile = false; }
    { class = "(org\\.kde\\.)?krunner"; tile = false; }
    { class = "(org\\.kde\\.)?yakuake"; tile = false; }
    { class = "(org\\.kde\\.)?dolphin"; tile = false; }
    { class = "(org\\.kde\\.)?spectacle"; tile = false; }
    { class = "systemsettings"; tile = false; }
    { class = "steam"; caption = "Steam Big Picture Mode"; tile = false; }
    { class = "zoom"; caption = "Zoom Cloud Meetings|zoom|zoom <2>"; tile = false; }
    { class = "jetbrains-.*"; caption = "splash"; tile = false; }
    { class = "jetbrains-.*"; caption = "Unstash Changes|Paths Affected by stash@.*"; tile = true; }
    { class = "com.mitchellh.ghostty"; tile = false; }
    { class = "org.freedesktop.impl.portal.desktop.kde"; tile = false; }
  ];
in
{
  programs.plasma = {
    enable = true;
    # Preserve KDE settings not explicitly managed by this module.
    overrideConfig = false;

    kwin = {
      cornerBarrier = false;
      edgeBarrier = 0;
      virtualDesktops = {
        number = 1;
        rows = 1;
      };
      # The original per-monitor native tiling layouts both use 4px padding.
      # Their UUID-dependent layouts are intentionally not frozen here.
      tiling.padding = 4;
    };

    # Only complete KWin window rules were translated. The source
    # contains Steam/Vesktop `noborderrule=2`, but no `noborder` value.
    # Those two incomplete rules are deliberately not invented here.
    window-rules = [
      {
        description = "Settings for org.kde.dolphin";
        match.window-class = "org.kde.dolphin";
        apply = {
          above = { value = true; apply = "remember"; };
          placement = { value = 7; apply = "force"; };
          size = { value = "1000,600"; apply = "remember"; };
        };
      }
      {
        description = "Settings for com.mitchellh.ghostty";
        match.window-class = "com.mitchellh.ghostty";
        apply = {
          placement = { value = 7; apply = "force"; };
          size = { value = "1050,600"; apply = "remember"; };
        };
      }
    ];

    # Explicit shortcuts from the export; empty default bindings removed.
    shortcuts = {
      # Core KWin, keyboard, media, KDE session, Spectacle and Plasma
      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
      kaccess."Toggle Screen Reader On and Off" = "Meta+Alt+S";
      kmix.decrease_microphone_volume = "Microphone Volume Down";
      kmix.decrease_volume = "Volume Down";
      kmix.decrease_volume_small = "Shift+Volume Down";
      kmix.increase_microphone_volume = "Microphone Volume Up";
      kmix.increase_volume = "Volume Up";
      kmix.increase_volume_small = "Shift+Volume Up";
      kmix.mic_mute = ["Microphone Mute" "Meta+Volume Mute"];
      kmix.mute = "Volume Mute";
      ksmserver."Lock Session" = ["Meta+L" "Screensaver"];
      ksmserver."Log Out" = "Ctrl+Alt+Del";
      kwin."Activate Window Demanding Attention" = "Meta+Ctrl+A";
      kwin.Expose = ["Meta+F9" "Ctrl+F9"];
      kwin.ExposeAll = ["Meta+F10" "Launch (C)" "Ctrl+F10"];
      kwin.ExposeClass = ["Meta+F7" "Ctrl+F7"];
      kwin."Grid View" = "Meta+G";
      kwin."Kill Window" = "Meta+Ctrl+Esc";
      kwin.MinimizeAll = "Meta+Shift+D";
      kwin.MoveMouseToCenter = "Meta+F6";
      kwin.MoveMouseToFocus = "Meta+F5";
      kwin."Show Desktop" = "Meta+D";
      kwin."Switch One Desktop Down" = "Meta+Ctrl+Down";
      kwin."Switch One Desktop Up" = "Meta+Ctrl+Up";
      kwin."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      kwin."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      kwin."Switch Window Down" = "Meta+Alt+Down";
      kwin."Switch Window Left" = "Meta+Alt+Left";
      kwin."Switch Window Right" = "Meta+Alt+Right";
      kwin."Switch Window Up" = "Meta+Alt+Up";
      kwin."Switch to Desktop 1" = ["Meta+F1" "Ctrl+F1"];
      kwin."Switch to Desktop 2" = ["Meta+F2" "Ctrl+F2"];
      kwin."Switch to Desktop 3" = ["Meta+F3" "Ctrl+F3"];
      kwin."Switch to Desktop 4" = ["Meta+F4" "Ctrl+F4"];
      kwin."Walk Through Windows" = ["Meta+Tab" "Alt+Tab"];
      kwin."Walk Through Windows (Reverse)" = ["Meta+Shift+Tab" "Alt+Shift+Tab"];
      kwin."Walk Through Windows of Current Application" = ["Meta+`" "Alt+`"];
      kwin."Walk Through Windows of Current Application (Reverse)" = ["Meta+~" "Alt+~"];
      kwin."Window Close" = ["Alt+F4" "Meta+Q"];
      kwin."Window Fullscreen" = "Meta+F";
      kwin."Window Maximize" = "Meta+PgUp";
      kwin."Window Minimize" = "Meta+PgDown";
      kwin."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      kwin."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      kwin."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      kwin."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      kwin."Window Operations Menu" = "Alt+F3";
      kwin.disableInputCapture = "Meta+Shift+Esc";
      kwin.minimizeAllOthers = "Meta+Shift+O";
      kwin.view_zoom_in = ["Meta++" "Meta+="];
      kwin.view_zoom_out = "Meta+-";
      mediacontrol.nextmedia = "Media Next";
      mediacontrol.pausemedia = "Media Pause";
      mediacontrol.playpausemedia = "Media Play";
      mediacontrol.previousmedia = "Media Previous";
      mediacontrol.seekbackwardmedia = "Media Rewind";
      mediacontrol.seekforwardmedia = "Media Fast Forward";
      mediacontrol.stopmedia = "Media Stop";
      org_kde_powerdevil."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
      org_kde_powerdevil."Decrease Screen Brightness" = "Monitor Brightness Down";
      org_kde_powerdevil."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
      org_kde_powerdevil.Hibernate = "Hibernate";
      org_kde_powerdevil."Increase Keyboard Brightness" = "Keyboard Brightness Up";
      org_kde_powerdevil."Increase Screen Brightness" = "Monitor Brightness Up";
      org_kde_powerdevil."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
      org_kde_powerdevil.PowerDown = "Power Down";
      org_kde_powerdevil.PowerOff = "Power Off";
      org_kde_powerdevil.Sleep = "Sleep";
      org_kde_powerdevil."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
      org_kde_powerdevil.powerProfile = ["Battery" "Meta+B"];
      plasmashell."activate application launcher" = "Alt+F1";
      plasmashell.clipboard_action = "Meta+Ctrl+X";
      plasmashell.cycle-panels = "Meta+Alt+P";
      plasmashell."next activity" = "Meta+A";
      plasmashell."previous activity" = "Meta+Shift+A";
      plasmashell."show dashboard" = "Ctrl+F12";
      plasmashell.show-on-mouse-pos = "Meta+V";

      # Karousel shortcuts
      kwin.karousel-column-move-end = "Meta+End";
      kwin.karousel-column-move-start = "Meta+Home";
      kwin.karousel-column-move-to-column-1 = "Meta+Ctrl+Shift+1";
      kwin.karousel-column-move-to-column-2 = "Meta+Ctrl+Shift+2";
      kwin.karousel-column-move-to-column-3 = "Meta+Ctrl+Shift+3";
      kwin.karousel-column-move-to-column-4 = "Meta+Ctrl+Shift+4";
      kwin.karousel-column-move-to-column-5 = "Meta+Ctrl+Shift+5";
      kwin.karousel-column-move-to-column-6 = "Meta+Ctrl+Shift+6";
      kwin.karousel-column-move-to-column-7 = "Meta+Ctrl+Shift+7";
      kwin.karousel-column-move-to-column-8 = "Meta+Ctrl+Shift+8";
      kwin.karousel-column-move-to-column-9 = "Meta+Ctrl+Shift+9";
      kwin.karousel-column-move-to-desktop-1 = "Meta+1";
      kwin.karousel-column-move-to-desktop-10 = "Meta+0";
      kwin.karousel-column-move-to-desktop-11 = "Meta+Ctrl+Shift+F11";
      kwin.karousel-column-move-to-desktop-12 = "Meta+Ctrl+Shift+F12";
      kwin.karousel-column-move-to-desktop-2 = "Meta+2";
      kwin.karousel-column-move-to-desktop-3 = "Meta+3";
      kwin.karousel-column-move-to-desktop-4 = "Meta+4";
      kwin.karousel-column-move-to-desktop-5 = "Meta+5";
      kwin.karousel-column-move-to-desktop-6 = "Meta+6";
      kwin.karousel-column-move-to-desktop-7 = "Meta+7";
      kwin.karousel-column-move-to-desktop-8 = "Meta+8";
      kwin.karousel-column-move-to-desktop-9 = "Meta+9";
      kwin.karousel-column-toggle-stacked = "Meta+X";
      kwin.karousel-column-width-decrease = "Meta+Ctrl+-";
      kwin.karousel-column-width-increase = "Meta+Ctrl++";
      kwin.karousel-columns-squeeze-right = "Meta+Ctrl+D";
      kwin.karousel-cycle-preset-widths = "Meta+R";
      kwin.karousel-focus-down = "Meta+Down";
      kwin.karousel-focus-left = "Meta+Left";
      kwin.karousel-focus-right = "Meta+Right";
      kwin.karousel-focus-up = "Meta+Up";
      kwin.karousel-grid-scroll-end = "Meta+Alt+End";
      kwin.karousel-grid-scroll-focused = "Meta+Alt+Return";
      kwin.karousel-grid-scroll-left = "Meta+Alt+PgUp";
      kwin.karousel-grid-scroll-left-column = "Meta+Alt+A";
      kwin.karousel-grid-scroll-right = "Meta+Alt+PgDown";
      kwin.karousel-grid-scroll-right-column = "Meta+Alt+D";
      kwin.karousel-grid-scroll-start = "Meta+Alt+Home";
      kwin.karousel-screen-switch = "Meta+Ctrl+Return";
      kwin.karousel-tail-move-to-desktop-1 = "Meta+Ctrl+Alt+Shift+F1";
      kwin.karousel-tail-move-to-desktop-10 = "Meta+Ctrl+Alt+Shift+F10";
      kwin.karousel-tail-move-to-desktop-11 = "Meta+Ctrl+Alt+Shift+F11";
      kwin.karousel-tail-move-to-desktop-12 = "Meta+Ctrl+Alt+Shift+F12";
      kwin.karousel-tail-move-to-desktop-2 = "Meta+Ctrl+Alt+Shift+F2";
      kwin.karousel-tail-move-to-desktop-3 = "Meta+Ctrl+Alt+Shift+F3";
      kwin.karousel-tail-move-to-desktop-4 = "Meta+Ctrl+Alt+Shift+F4";
      kwin.karousel-tail-move-to-desktop-5 = "Meta+Ctrl+Alt+Shift+F5";
      kwin.karousel-tail-move-to-desktop-6 = "Meta+Ctrl+Alt+Shift+F6";
      kwin.karousel-tail-move-to-desktop-7 = "Meta+Ctrl+Alt+Shift+F7";
      kwin.karousel-tail-move-to-desktop-8 = "Meta+Ctrl+Alt+Shift+F8";
      kwin.karousel-tail-move-to-desktop-9 = "Meta+Ctrl+Alt+Shift+F9";
      kwin.karousel-window-move-down = "Meta+Shift+Down";
      kwin.karousel-window-move-end = "Meta+Shift+End";
      kwin.karousel-window-move-left = "Meta+Shift+Left";
      kwin.karousel-window-move-right = "Meta+Shift+Right";
      kwin.karousel-window-move-start = "Meta+Shift+Home";
      kwin.karousel-window-move-to-column-1 = "Meta+Shift+1";
      kwin.karousel-window-move-to-column-2 = "Meta+Shift+2";
      kwin.karousel-window-move-to-column-3 = "Meta+Shift+3";
      kwin.karousel-window-move-to-column-4 = "Meta+Shift+4";
      kwin.karousel-window-move-to-column-5 = "Meta+Shift+5";
      kwin.karousel-window-move-to-column-6 = "Meta+Shift+6";
      kwin.karousel-window-move-to-column-7 = "Meta+Shift+7";
      kwin.karousel-window-move-to-column-8 = "Meta+Shift+8";
      kwin.karousel-window-move-to-column-9 = "Meta+Shift+9";
      kwin.karousel-window-move-up = "Meta+Shift+Up";
      kwin.karousel-window-toggle-floating = "Meta+Space";

      # Application launchers
      "services/com.mitchellh.ghostty.desktop"._launch = "Meta+T";
      "services/org.kde.spectacle.desktop".RecordRegion = "Meta+Shift+R";
      "services/zen-twilight.desktop"._launch = "Meta+W";

      # Meaningful empty shortcuts: prevent KDE defaults from colliding
      # with Karousel navigation and the custom Meta+W browser launcher.
      kwin.Overview = [ ];
      kwin."Edit Tiles" = "Meta+Shift+T";
      kwin."Window Quick Tile Left" = [ ];
      kwin."Window Quick Tile Right" = [ ];
      kwin."Window Quick Tile Top" = [ ];
      kwin."Window Quick Tile Bottom" = [ ];
      kwin."Window Quick Tile Top Left" = [ ];
      kwin."Window Quick Tile Top Right" = [ ];
      kwin."Window Quick Tile Bottom Left" = [ ];
      kwin."Window Quick Tile Bottom Right" = [ ];
    };

    configFile = {
      # KWin compositor, scripts, focus, scaling and decorations.
      kwinrc = {
        Plugins = {
          karouselEnabled = true;
          minimizeallEnabled = true;
        };
        Script-karousel = {
          gapsInnerHorizontal = 16;
          gapsInnerVertical = 16;
          reMaximize = true;
          resizeNeighborColumn = true;
          skipSwitcher = true;
          stackOffsetX = 16;
          stackOffsetY = 16;
          windowRules = builtins.toJSON karouselRules;
        };
        Windows = {
          DelayFocusInterval = 0;
          FocusPolicy = "FocusFollowsMouse";
          NextFocusPrefersMouse = true;
        };
        Xwayland.Scale = 1.1;
        "org.kde.kdecoration2".theme = "Plasma-Overdose-KWinDeco";
      };

      # Persistent Plasma appearance and UI preferences (from the
      # same export; can be moved to appearance.nix later).
      # dolphinrc
      dolphinrc.CompactMode.PreviewSize = 16;
      dolphinrc.DetailsMode.PreviewSize = 22;
      dolphinrc."KFileDialog Settings"."Places Icons Auto-resize" = false;
      dolphinrc."KFileDialog Settings"."Places Icons Static Size" = 22;

      # katerc
      katerc.General."Days Meta Infos" = 30;
      katerc.General."Save Meta Infos" = true;
      katerc.General."Show Full Path in Title" = false;
      katerc.General."Show Menu Bar" = true;
      katerc.General."Show Status Bar" = true;
      katerc.General."Show Tab Bar" = true;
      katerc.General."Show Url Nav Bar" = true;
      katerc.filetree.editShade = "82,63,34";
      katerc.filetree.listMode = false;
      katerc.filetree.middleClickToClose = false;
      katerc.filetree.shadingEnabled = true;
      katerc.filetree.showCloseButton = false;
      katerc.filetree.showFullPathOnRoots = false;
      katerc.filetree.showToolbar = true;
      katerc.filetree.sortRole = 0;
      katerc.filetree.viewShade = "60,55,45";

      # kcminputrc
      kcminputrc.Keyboard.NumLock = 0;
      kcminputrc."Libinput/7511/64096/2.4G Wireless Device".PointerAcceleration = 0.000;
      kcminputrc."Libinput/7511/64096/2.4G Wireless Device".PointerAccelerationProfile = 1;
      kcminputrc.Mouse.cursorSize = 32;
      kcminputrc.Mouse.cursorTheme = "Plasma-Overdose-Cream";

      # kdeglobals
      kdeglobals.General.AccentColor = "150,112,58";
      kdeglobals.General.LastUsedCustomAccentColor = "150,112,58";
      kdeglobals.General.TerminalService = "com.mitchellh.ghostty.desktop";
      kdeglobals.General.XftAntialias = true;
      kdeglobals.General.XftHintStyle = "hintslight";
      kdeglobals.General.XftSubPixel = "vbgr";
      kdeglobals.General.fixed = "DepartureMono Nerd Font Mono,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.General.font = "DepartureMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.General.menuFont = "DepartureMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.General.smallestReadableFont = "DepartureMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.General.toolBarFont = "DepartureMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.Icons.Theme = "pixora";
      kdeglobals.KDE.DefaultDarkLookAndFeel = "com.github.huppiflupp.nt-legacy-desert-nacht";
      kdeglobals.KDE.DefaultLightLookAndFeel = "com.github.huppiflupp.nt-legacy-desert";
      kdeglobals.KDE.contrast = 2;
      kdeglobals.KDE.frameContrast = 0.2;
      kdeglobals."KFileDialog Settings"."Allow Expansion" = false;
      kdeglobals."KFileDialog Settings"."Automatically select filename extension" = true;
      kdeglobals."KFileDialog Settings"."Breadcrumb Navigation" = false;
      kdeglobals."KFileDialog Settings"."Decoration position" = 2;
      kdeglobals."KFileDialog Settings"."Show Full Path" = false;
      kdeglobals."KFileDialog Settings"."Show Inline Previews" = true;
      kdeglobals."KFileDialog Settings"."Show Preview" = false;
      kdeglobals."KFileDialog Settings"."Show Speedbar" = true;
      kdeglobals."KFileDialog Settings"."Show hidden files" = true;
      kdeglobals."KFileDialog Settings"."Sort by" = "Name";
      kdeglobals."KFileDialog Settings"."Sort directories first" = true;
      kdeglobals."KFileDialog Settings"."Sort hidden files last" = false;
      kdeglobals."KFileDialog Settings"."Sort reversed" = true;
      kdeglobals."KFileDialog Settings"."Speedbar Width" = 140;
      kdeglobals."KFileDialog Settings"."View Style" = "DetailTree";
      kdeglobals.WM.activeBackground = "216,208,192";
      kdeglobals.WM.activeBlend = "150,112,58";
      kdeglobals.WM.activeFont = "DepartureMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
      kdeglobals.WM.activeForeground = "32,38,40";
      kdeglobals.WM.inactiveBackground = "255,255,255";
      kdeglobals.WM.inactiveBlend = "106,92,70";
      kdeglobals.WM.inactiveForeground = "32,38,40";

      # kiorc
      kiorc.Confirmations.ConfirmEmptyTrash = true;

      # ksplashrc
      ksplashrc.KSplash.Theme = "com.github.huppiflupp.nt-legacy-desert";

      # kxkbrc
      kxkbrc.Layout.LayoutList = "us";
      kxkbrc.Layout.Use = true;
      kxkbrc.Layout.VariantList = "alt-intl";

      # plasma-localerc
      plasma-localerc.Formats.LANG = "en_US.UTF-8";

      # spectaclerc
      spectaclerc.ImageSave.translatedScreenshotsFolder = "Screenshots";
      spectaclerc.VideoSave.translatedScreencastsFolder = "Screencasts";

      # Lock screen image; uses the Wallpapers symlink from home/home.nix.
      kscreenlockerrc."Greeter/Wallpaper/org.kde.image/General".Image = lockWallpaper;
      kscreenlockerrc."Greeter/Wallpaper/org.kde.image/General".PreviewImage = lockWallpaper;
    };
  };
}
