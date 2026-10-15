# KDE Plasma configuration (Plasma Manager / Home Manager)
#
# Contents:
#   1. Plasma Manager enablement
#   2. Global shortcuts (KWin, Karousel, desktop, media, apps)
#   3. KConfig settings (appearance, window rules, input, applications, services)
#   4. Application state (Kate session)
#
# This is an organization-only rewrite of the rc2nix configuration.
# All original keys and values are intentionally preserved, including empty
# shortcuts, temporary paths, and application state.
# Some settings refer to this machine's paths or specific screen identifiers.
# Edit values in place when needed; don't delete entries without checking them.

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
    # Plasma Manager
    enable = true;

    workspace.wallpaper = [
      "/home/tsora/Pictures/Wallpapers/MONITOR1/Astral_Grave/wallhaven-l8xwdp_3440x1440.png"
      "/home/tsora/Pictures/Wallpapers/MONITOR2/Frieren/Glasses.png"
    ];

    # Keyboard shortcuts
    shortcuts = {
      # Window management
      kwin = {
        # 01  KWin overview, effects, and general actions
        "Activate Window Demanding Attention" = "Meta+Ctrl+A";
        "Cycle Overview" = [ ];
        "Cycle Overview Opposite" = [ ];
        "Decrease Opacity" = [ ];
        "Edit Tiles" = "Meta+Shift+T";
        Expose = [ "Meta+F9" "Ctrl+F9" ];
        ExposeAll = [ "Meta+F10" "Launch (C)" "Ctrl+F10" ];
        ExposeClass = [ "Meta+F7" "Ctrl+F7" ];
        ExposeClassCurrentDesktop = [ ];
        "Grid View" = "Meta+G";
        "Increase Opacity" = [ ];
        "Kill Window" = "Meta+Ctrl+Esc";
        MoveMouseToCenter = "Meta+F6";
        MoveMouseToFocus = "Meta+F5";
        MoveZoomDown = [ ];
        MoveZoomLeft = [ ];
        MoveZoomRight = [ ];
        MoveZoomUp = [ ];
        Overview = [ ];
        "Setup Window Shortcut" = [ ];
        "Show Desktop" = "Meta+D";
        "Switch to Next Screen" = [ ];
        "Switch to Previous Screen" = [ ];
        "Toggle Night Color" = [ ];
        "Toggle Window Raise/Lower" = [ ];
        "Walk Through Windows" = [ "Meta+Tab" "Alt+Tab" ];
        "Walk Through Windows (Reverse)" = [ "Meta+Shift+Tab" "Alt+Shift+Tab" ];
        "Walk Through Windows Alternative" = [ ];
        "Walk Through Windows Alternative (Reverse)" = [ ];
        "Walk Through Windows of Current Application" = [ "Meta+`" "Alt+`" ];
        "Walk Through Windows of Current Application (Reverse)" = [ "Meta+~" "Alt+~" ];
        "Walk Through Windows of Current Application Alternative" = [ ];
        "Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
        disableInputCapture = "Meta+Shift+Esc";
        view_actual_size = [ ];
        view_zoom_in = [ "Meta++" "Meta+\x3d" ];
        view_zoom_out = "Meta+-";

        # 02  Virtual desktops
        "Switch One Desktop Down" = "Meta+Ctrl+Down";
        "Switch One Desktop Up" = "Meta+Ctrl+Up";
        "Switch One Desktop to the Left" = "Meta+Ctrl+Left";
        "Switch One Desktop to the Right" = "Meta+Ctrl+Right";
        "Switch to Desktop 1" = [ "Meta+F1" "Ctrl+F1" ];
        "Switch to Desktop 10" = [ ];
        "Switch to Desktop 11" = [ ];
        "Switch to Desktop 12" = [ ];
        "Switch to Desktop 13" = [ ];
        "Switch to Desktop 14" = [ ];
        "Switch to Desktop 15" = [ ];
        "Switch to Desktop 16" = [ ];
        "Switch to Desktop 17" = [ ];
        "Switch to Desktop 18" = [ ];
        "Switch to Desktop 19" = [ ];
        "Switch to Desktop 2" = [ "Meta+F2" "Ctrl+F2" ];
        "Switch to Desktop 20" = [ ];
        "Switch to Desktop 21" = [ ];
        "Switch to Desktop 22" = [ ];
        "Switch to Desktop 23" = [ ];
        "Switch to Desktop 24" = [ ];
        "Switch to Desktop 25" = [ ];
        "Switch to Desktop 3" = [ "Meta+F3" "Ctrl+F3" ];
        "Switch to Desktop 4" = [ "Meta+F4" "Ctrl+F4" ];
        "Switch to Desktop 5" = [ ];
        "Switch to Desktop 6" = [ ];
        "Switch to Desktop 7" = [ ];
        "Switch to Desktop 8" = [ ];
        "Switch to Desktop 9" = [ ];
        "Switch to Next Desktop" = [ ];
        "Switch to Previous Desktop" = [ ];

        # 03  Screen and window navigation
        "Move Tablet to Next LogicalOutput" = [ ];
        "Switch Window Down" = "Meta+Alt+Down";
        "Switch Window Left" = "Meta+Alt+Left";
        "Switch Window Right" = "Meta+Alt+Right";
        "Switch Window Up" = "Meta+Alt+Up";
        "Switch to Screen 0" = [ ];
        "Switch to Screen 1" = [ ];
        "Switch to Screen 2" = [ ];
        "Switch to Screen 3" = [ ];
        "Switch to Screen 4" = [ ];
        "Switch to Screen 5" = [ ];
        "Switch to Screen 6" = [ ];
        "Switch to Screen 7" = [ ];
        "Switch to Screen Above" = [ ];
        "Switch to Screen Below" = [ ];
        "Switch to Screen to the Left" = [ ];
        "Switch to Screen to the Right" = [ ];

        # 04  Window actions
        MinimizeAll = "Meta+Shift+D";
        MinimizeAllActiveScreen = [ ];
        "Window Above Other Windows" = [ ];
        "Window Below Other Windows" = [ ];
        "Window Close" = [ "Alt+F4" "Meta+Q" ];
        "Window Custom Quick Tile Bottom" = [ ];
        "Window Custom Quick Tile Left" = [ ];
        "Window Custom Quick Tile Right" = [ ];
        "Window Custom Quick Tile Top" = [ ];
        "Window Fullscreen" = "Meta+F";
        "Window Grow Horizontal" = [ ];
        "Window Grow Vertical" = [ ];
        "Window Lower" = [ ];
        "Window Maximize" = "Meta+PgUp";
        "Window Maximize Horizontal" = [ ];
        "Window Maximize Vertical" = [ ];
        "Window Minimize" = "Meta+PgDown";
        "Window Move" = [ ];
        "Window Move Center" = [ ];
        "Window No Border" = [ ];
        "Window On All Desktops" = [ ];
        "Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        "Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
        "Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
        "Window One Screen Down" = [ ];
        "Window One Screen Up" = [ ];
        "Window One Screen to the Left" = [ ];
        "Window One Screen to the Right" = [ ];
        "Window Operations Menu" = "Alt+F3";
        "Window Pack Down" = [ ];
        "Window Pack Left" = [ ];
        "Window Pack Right" = [ ];
        "Window Pack Up" = [ ];
        "Window Quick Tile Bottom" = [ ];
        "Window Quick Tile Bottom Left" = [ ];
        "Window Quick Tile Bottom Right" = [ ];
        "Window Quick Tile Left" = [ ];
        "Window Quick Tile Right" = [ ];
        "Window Quick Tile Top" = [ ];
        "Window Quick Tile Top Left" = [ ];
        "Window Quick Tile Top Right" = [ ];
        "Window Raise" = [ ];
        "Window Resize" = [ ];
        "Window Shrink Horizontal" = [ ];
        "Window Shrink Vertical" = [ ];
        "Window to Desktop 1" = [ ];
        "Window to Desktop 10" = [ ];
        "Window to Desktop 11" = [ ];
        "Window to Desktop 12" = [ ];
        "Window to Desktop 13" = [ ];
        "Window to Desktop 14" = [ ];
        "Window to Desktop 15" = [ ];
        "Window to Desktop 16" = [ ];
        "Window to Desktop 17" = [ ];
        "Window to Desktop 18" = [ ];
        "Window to Desktop 19" = [ ];
        "Window to Desktop 2" = [ ];
        "Window to Desktop 20" = [ ];
        "Window to Desktop 21" = [ ];
        "Window to Desktop 22" = [ ];
        "Window to Desktop 23" = [ ];
        "Window to Desktop 24" = [ ];
        "Window to Desktop 25" = [ ];
        "Window to Desktop 3" = [ ];
        "Window to Desktop 4" = [ ];
        "Window to Desktop 5" = [ ];
        "Window to Desktop 6" = [ ];
        "Window to Desktop 7" = [ ];
        "Window to Desktop 8" = [ ];
        "Window to Desktop 9" = [ ];
        "Window to Next Desktop" = [ ];
        "Window to Next Screen" = [ ];
        "Window to Previous Desktop" = [ ];
        "Window to Previous Screen" = [ ];
        "Window to Screen 0" = [ ];
        "Window to Screen 1" = [ ];
        "Window to Screen 2" = [ ];
        "Window to Screen 3" = [ ];
        "Window to Screen 4" = [ ];
        "Window to Screen 5" = [ ];
        "Window to Screen 6" = [ ];
        "Window to Screen 7" = [ ];
        minimizeAllOthers = "Meta+Shift+O";
        minimizeAllOthersActiveScreen = [ ];

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

      # Desktop and session
      ActivityManager.switch-to-activity-97dcd993-5c49-4b35-865f-a78d457885d5 = [ ];
      plasmashell = {
        "Slideshow Wallpaper Next Image" = [ ];
        "activate application launcher" = "Alt+F1";
        "activate task manager entry 1" = [ ];
        "activate task manager entry 10" = [ ];
        "activate task manager entry 2" = [ ];
        "activate task manager entry 3" = [ ];
        "activate task manager entry 4" = [ ];
        "activate task manager entry 5" = [ ];
        "activate task manager entry 6" = [ ];
        "activate task manager entry 7" = [ ];
        "activate task manager entry 8" = [ ];
        "activate task manager entry 9" = [ ];
        clear-history = [ ];
        clipboard_action = "Meta+Ctrl+X";
        cycle-panels = "Meta+Alt+P";
        cycleNextAction = [ ];
        cyclePrevAction = [ ];
        edit_clipboard = [ ];
        "manage activities" = [ ];
        "next activity" = "Meta+A";
        "previous activity" = "Meta+Shift+A";
        repeat_action = [ ];
        "show dashboard" = "Ctrl+F12";
        show-barcode = [ ];
        show-on-mouse-pos = "Meta+V";
        "switch to next activity" = [ ];
        "switch to previous activity" = [ ];
        "toggle do not disturb" = [ ];
      };
      ksmserver = {
        "Halt Without Confirmation" = [ ];
        "Lock Session" = [
          "Meta+L"
          "Screensaver"
        ];
        "Log Out" = "Ctrl+Alt+Del";
        "Log Out Without Confirmation" = [ ];
        LogOut = [ ];
        Reboot = [ ];
        "Reboot Without Confirmation" = [ ];
        "Shut Down" = [ ];
      };

      # Input and accessibility
      "KDE Keyboard Layout Switcher" = {
        "Switch keyboard layout to English (US, alt. intl.)" = [ ];
        "Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
        "Switch to Next Keyboard Layout" = "Meta+Alt+K";
      };
      kaccess."Toggle Screen Reader On and Off" = "Meta+Alt+S";

      # Audio, media, and power
      kmix = {
        decrease_microphone_volume = "Microphone Volume Down";
        decrease_volume = "Volume Down";
        decrease_volume_small = "Shift+Volume Down";
        increase_microphone_volume = "Microphone Volume Up";
        increase_volume = "Volume Up";
        increase_volume_small = "Shift+Volume Up";
        mic_mute = [ "Microphone Mute" "Meta+Volume Mute" ];
        mute = "Volume Mute";
      };
      mediacontrol = {
        mediavolumedown = [ ];
        mediavolumeup = [ ];
        nextmedia = "Media Next";
        pausemedia = "Media Pause";
        playmedia = [ ];
        playpausemedia = "Media Play";
        previousmedia = "Media Previous";
        seekbackwardmedia = "Media Rewind";
        seekbackwardmedialong = [ ];
        seekforwardmedia = "Media Fast Forward";
        seekforwardmedialong = [ ];
        stopmedia = "Media Stop";
      };
      org_kde_powerdevil = {
        "Decrease Keyboard Brightness" = "Keyboard Brightness Down";
        "Decrease Screen Brightness" = "Monitor Brightness Down";
        "Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
        Hibernate = "Hibernate";
        "Increase Keyboard Brightness" = "Keyboard Brightness Up";
        "Increase Screen Brightness" = "Monitor Brightness Up";
        "Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
        PowerDown = "Power Down";
        PowerOff = "Power Off";
        Sleep = "Sleep";
        "Toggle Keyboard Backlight" = "Keyboard Light On/Off";
        "Turn Off Screen" = [ ];
        powerProfile = [
          "Battery"
          "Meta+B"
        ];
      };

      # Application launchers and Spectacle
      "services/com.mitchellh.ghostty.desktop"._launch = "Meta+T";
      "services/org.kde.spectacle.desktop" = {
        CurrentMonitorScreenShot = [ ];
        OpenWithoutScreenshot = [ ];
        RecordRegion = "Meta+Shift+R";
      };
      "services/zen-twilight.desktop"._launch = "Meta+W";
    };

    # KConfig / KDE application settings
    configFile = {
      # Appearance, themes, wallpapers, and locale
      kdeglobals = {
        General = {
          AccentColor = "150,112,58";
          LastUsedCustomAccentColor = "150,112,58";
          TerminalApplication = "/nix/store/k39mzmgrkpx5p1mxcdf9c2j8g9igjz5b-ghostty-1.3.1/bin/ghostty --gtk-single-instance=true";
          TerminalService = "com.mitchellh.ghostty.desktop";
          XftAntialias = true;
          XftHintStyle = "hintslight";
          XftSubPixel = "vbgr";
          fixed = "DepartureMono Nerd Font Mono,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
          font = "DepartureMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
          menuFont = "DepartureMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
          smallestReadableFont = "DepartureMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
          toolBarFont = "DepartureMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
        };
        Icons.Theme = "pixora";
        KDE = {
          DefaultDarkLookAndFeel = "com.github.huppiflupp.nt-legacy-desert-nacht";
          DefaultLightLookAndFeel = "com.github.huppiflupp.nt-legacy-desert";
          contrast = 2;
          frameContrast = 0.2;
        };
        "KFileDialog Settings" = {
          "Allow Expansion" = false;
          "Automatically select filename extension" = true;
          "Breadcrumb Navigation" = false;
          "Decoration position" = 2;
          "Show Full Path" = false;
          "Show Inline Previews" = true;
          "Show Preview" = false;
          "Show Speedbar" = true;
          "Show hidden files" = true;
          "Sort by" = "Name";
          "Sort directories first" = true;
          "Sort hidden files last" = false;
          "Sort reversed" = true;
          "Speedbar Width" = 140;
          "View Style" = "DetailTree";
        };
        WM = {
          activeBackground = "216,208,192";
          activeBlend = "150,112,58";
          activeFont = "DepartureMono Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,,0,0";
          activeForeground = "32,38,40";
          inactiveBackground = "255,255,255";
          inactiveBlend = "106,92,70";
          inactiveForeground = "32,38,40";
        };
      };
      ksplashrc.KSplash.Theme = "com.github.huppiflupp.nt-legacy-desert";
      # Lock-screen wallpaper only (NOT the desktop background).
      # For your per-monitor desktop wallpapers, see the note below and
      # ~/.config/plasma-org.kde.plasma.desktop-appletsrc.
      kscreenlockerrc = {
        Daemon = {
          Autolock = false;
          Timeout = 0;
        };
        "Greeter/Wallpaper/org.kde.image/General" = {
          Image = "file:///home/tsora/Pictures/Wallpapers/MONITOR1/Astral_Grave/wallhaven-l8xwdp_3440x1440.png";
          PreviewImage = "file:///home/tsora/Pictures/Wallpapers/MONITOR1/Astral_Grave/wallhaven-l8xwdp_3440x1440.png";
        };
      };
      # Wallpaper picker history: this list does NOT assign images to monitors.
      plasmarc.Wallpapers.usersWallpapers = "/home/tsora/Pictures/Wallpapers/MONITOR1/Astral_Grave/wallhaven-l8xwdp_3440x1440.png,/home/tsora/Pictures/Wallpapers/MONITOR2/Frieren/Glasses.png,/home/tsora/Pictures/Wallpapers/MONITOR2/Frieren/JourneyLight.png";
      plasma-localerc.Formats.LANG = "en_US.UTF-8";

      # KWin — compositor, tiling, and window rules
      kwinrc = {
        # Desktops, focus, and pointer edges
        Desktops = {
          Id_1 = "Desktop_1";
          Number = 1;
          Rows = 1;
        };
        Windows = {
          DelayFocusInterval = 0;
          FocusPolicy = "FocusFollowsMouse";
          NextFocusPrefersMouse = true;
        };
        EdgeBarrier = {
          CornerBarrier = false;
          EdgeBarrier = 0;
        };

        # KWin scripts and plugins
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
          # Rules are defined above as a normal Nix list. Add a new `(float "app")`
          # or `(tile "app")` there; no JSON escaping required.
          windowRules = builtins.toJSON karouselWindowRules;
        };

        # Native tiling configuration (including monitor-specific layouts)
        Tiling.padding = 4;
        "Tiling/2e81d7a2-3b84-447b-8e4c-9d527f014aa6/68306631-fe1e-4d4b-94ad-31e40cb6e5a5" = {
          padding = 4;
          tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"layoutDirection\":\"vertical\",\"tiles\":[{\"height\":0.5},{\"height\":0.5}],\"width\":1}]}";
        };
        "Tiling/2e81d7a2-3b84-447b-8e4c-9d527f014aa6/e27769ef-9008-43b2-9819-8b832afb22a0" = {
          padding = 4;
          tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        };
        "Tiling/Desktop_1/68306631-fe1e-4d4b-94ad-31e40cb6e5a5" = {
          padding = 4;
          tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        };
        "Tiling/Desktop_1/e27769ef-9008-43b2-9819-8b832afb22a0" = {
          padding = 4;
          tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        };

        # XWayland and window decorations
        Xwayland.Scale = 1.1;
        "org.kde.kdecoration2".theme = "Plasma-Overdose-KWinDeco";
      };
      kwinrulesrc = {
        # Dolphin
        "1" = {
          Description = "Settings for Dolphin";
          above = true;
          aboverule = 4;
          placement = 7;
          placementrule = 2;
          size = "1000,600";
          sizerule = 4;
          wmclass = "org.kde.dolphin";
          wmclasscomplete = true;
          wmclassmatch = 1;
        };

        # Ghostty
        "2" = {
          Description = "Settings for Ghostty";
          placement = 7;
          placementrule = 2;
          size = "1050,600";
          sizerule = 4;
          wmclass = "com.mitchellh.ghostty";
          wmclasscomplete = true;
          wmclassmatch = 1;
        };

        # Steam
        "3" = {
          Description = "Settings for Steam";
          decocolor = "PlasmaOverdoseCream";
          decocolorrule = 2;
          noborderrule = 2;
          wmclass = "steam";
          wmclasscomplete = true;
          wmclassmatch = 1;
        };

        # Vesktop
        "4" = {
          Description = "Settings for Vesktop";
          noborder = false;
          noborderrule = 2;
          wmclass = "vesktop";
          wmclasscomplete = true;
          wmclassmatch = 1;
        };

        # Rule ordering and count
        General = {
          count = 4;
          rules = "1,2,3,4";
        };
      };

      # Input — keyboard, pointer, and cursors
      kcminputrc = {
        Keyboard.NumLock = 0;
        "Libinput/7511/64096/2.4G Wireless Device" = {
          PointerAcceleration = 0.0;
          PointerAccelerationProfile = 1;
        };
        Mouse = {
          cursorSize = 32;
          cursorTheme = "Plasma-Overdose-Cream";
        };
      };
      kxkbrc.Layout = {
        LayoutList = "us";
        Use = true;
        VariantList = "alt-intl";
      };

      # Applications — Dolphin, Kate, Spectacle, and file dialogs
      dolphinrc = {
        CompactMode.PreviewSize = 16;
        DetailsMode.PreviewSize = 22;
        General.ViewPropsTimestamp = "2026,10,12,20,19,24.041";
        "KFileDialog Settings" = {
          "Places Icons Auto-resize" = false;
          "Places Icons Static Size" = 22;
        };
      };
      katerc = {
        General = {
          "Days Meta Infos" = 30;
          PinnedDocuments = "";
          "Save Meta Infos" = true;
          "Show Full Path in Title" = false;
          "Show Menu Bar" = true;
          "Show Status Bar" = true;
          "Show Tab Bar" = true;
          "Show Url Nav Bar" = true;
        };
        filetree = {
          editShade = "82,63,34";
          listMode = false;
          middleClickToClose = false;
          shadingEnabled = true;
          showCloseButton = false;
          showFullPathOnRoots = false;
          showToolbar = true;
          sortRole = 0;
          viewShade = "60,55,45";
        };
      };
      spectaclerc = {
        ImageSave = {
          lastImageSaveLocation = "file:///home/tsora/Pictures/Screenshots/Screenshot_20261013_170852.png";
          translatedScreenshotsFolder = "Screenshots";
        };
        VideoSave.translatedScreencastsFolder = "Screencasts";
        ViewerWindow = {
          "2 screens: Height" = 677;
          "2 screens: Width" = 968;
        };
      };
      kiorc.Confirmations.ConfirmEmptyTrash = true;

      # System services, activities, notifications, and miscellaneous
      baloofilerc.General.dbVersion = 2;
      kactivitymanagerdrc.activities."97dcd993-5c49-4b35-865f-a78d457885d5" = "Default";
      kded5rc.Module-device_automounter.autoload = false;
      kuriikwsfilterrc.General = {
        EnableWebShortcuts = true;
        KeywordDelimiter = ":";
        PreferredWebShortcuts = "";
        UsePreferredWebShortcutsOnly = false;
      };
      kwalletrc.Wallet."First Use" = false;
      plasmanotifyrc = {
        "Applications/firefox".Seen = true;
        "Applications/io.github.ciromattia.kcc".Seen = true;
        "Applications/org.qbittorrent.qBittorrent".Seen = true;
        "Applications/vesktop".Seen = true;
        "Applications/zen-twilight".Seen = true;
      };
    };

    # Application state files
    dataFile = {
      "kate/anonymous.katesession" = {
        "Document 0".URL = "file:///home/tsora/.ssh/config";
        "Kate Plugins" = {
          bookmarksplugin = false;
          cmaketoolsplugin = false;
          compilerexplorer = false;
          eslintplugin = false;
          externaltoolsplugin = true;
          formatplugin = false;
          katebacktracebrowserplugin = false;
          katebuildplugin = false;
          katecloseexceptplugin = false;
          katecolorpickerplugin = false;
          katectagsplugin = false;
          katefilebrowserplugin = false;
          katefiletreeplugin = true;
          kategdbplugin = false;
          kategitblameplugin = false;
          katekonsoleplugin = true;
          kateprojectplugin = true;
          katereplicodeplugin = false;
          katesearchplugin = true;
          katesnippetsplugin = false;
          katesqlplugin = false;
          katesymbolviewerplugin = false;
          katexmlcheckplugin = false;
          katexmltoolsplugin = false;
          keyboardmacrosplugin = false;
          ktexteditorpreviewplugin = false;
          latexcompletionplugin = false;
          lspclientplugin = true;
          openlinkplugin = false;
          rainbowparens = false;
          rbqlplugin = false;
          tabswitcherplugin = true;
          templateplugin = false;
          textfilterplugin = true;
        };
        MainWindow0 = {
          "Active ViewSpace" = 0;
          Kate-MDI-H-Splitter = "0,602,0";
          Kate-MDI-Sidebar-0-Bar-0-TvList = "kate_private_plugin_katefiletreeplugin,kateproject,kateprojectgit,lspclient_symbol_outline";
          Kate-MDI-Sidebar-0-LastSize = 200;
          Kate-MDI-Sidebar-0-SectSizes = 0;
          Kate-MDI-Sidebar-0-Splitter = 526;
          Kate-MDI-Sidebar-1-Bar-0-TvList = "";
          Kate-MDI-Sidebar-1-LastSize = 200;
          Kate-MDI-Sidebar-1-SectSizes = 0;
          Kate-MDI-Sidebar-1-Splitter = 1170;
          Kate-MDI-Sidebar-2-Bar-0-TvList = "";
          Kate-MDI-Sidebar-2-LastSize = 200;
          Kate-MDI-Sidebar-2-SectSizes = 0;
          Kate-MDI-Sidebar-2-Splitter = 602;
          Kate-MDI-Sidebar-3-Bar-0-TvList = "output,diagnostics,kate_plugin_katesearch,kateprojectinfo,kate_private_plugin_katekonsoleplugin";
          Kate-MDI-Sidebar-3-LastSize = 200;
          Kate-MDI-Sidebar-3-SectSizes = 0;
          Kate-MDI-Sidebar-3-Splitter = 193;
          Kate-MDI-Sidebar-Style = 2;
          Kate-MDI-Sidebar-Visible = true;
          Kate-MDI-ToolView-diagnostics-Position = 3;
          Kate-MDI-ToolView-diagnostics-Show-Button-In-Sidebar = true;
          Kate-MDI-ToolView-diagnostics-Visible = false;
          Kate-MDI-ToolView-kate_plugin_katesearch-Position = 3;
          Kate-MDI-ToolView-kate_plugin_katesearch-Show-Button-In-Sidebar = true;
          Kate-MDI-ToolView-kate_plugin_katesearch-Visible = false;
          Kate-MDI-ToolView-kate_private_plugin_katefiletreeplugin-Position = 0;
          Kate-MDI-ToolView-kate_private_plugin_katefiletreeplugin-Show-Button-In-Sidebar = true;
          Kate-MDI-ToolView-kate_private_plugin_katefiletreeplugin-Visible = false;
          Kate-MDI-ToolView-kate_private_plugin_katekonsoleplugin-Position = 3;
          Kate-MDI-ToolView-kate_private_plugin_katekonsoleplugin-Show-Button-In-Sidebar = true;
          Kate-MDI-ToolView-kate_private_plugin_katekonsoleplugin-Visible = false;
          Kate-MDI-ToolView-kateproject-Position = 0;
          Kate-MDI-ToolView-kateproject-Show-Button-In-Sidebar = true;
          Kate-MDI-ToolView-kateproject-Visible = false;
          Kate-MDI-ToolView-kateprojectgit-Position = 0;
          Kate-MDI-ToolView-kateprojectgit-Show-Button-In-Sidebar = true;
          Kate-MDI-ToolView-kateprojectgit-Visible = false;
          Kate-MDI-ToolView-kateprojectinfo-Position = 3;
          Kate-MDI-ToolView-kateprojectinfo-Show-Button-In-Sidebar = true;
          Kate-MDI-ToolView-kateprojectinfo-Visible = false;
          Kate-MDI-ToolView-lspclient_symbol_outline-Position = 0;
          Kate-MDI-ToolView-lspclient_symbol_outline-Show-Button-In-Sidebar = true;
          Kate-MDI-ToolView-lspclient_symbol_outline-Visible = false;
          Kate-MDI-ToolView-output-Position = 3;
          Kate-MDI-ToolView-output-Show-Button-In-Sidebar = true;
          Kate-MDI-ToolView-output-Visible = false;
          Kate-MDI-V-Splitter = "0,526,0";
        };
        "MainWindow0 Settings".WindowState = 8;
        "MainWindow0-Splitter 0" = {
          Children = "MainWindow0-ViewSpace 0";
          Orientation = 1;
          Sizes = 602;
        };
        "MainWindow0-ViewSpace 0" = {
          "Active View" = 0;
          Count = 1;
          Documents = 0;
          "View 0" = 0;
        };
        "Open Documents".Count = 1;
        "Open MainWindows".Count = 1;
        "Plugin:kateprojectplugin:".projects = "";
        "Plugin:katesearchplugin:MainWindow:0" = {
          BinaryFiles = false;
          CurrentExcludeFilter = "-1";
          CurrentFilter = "-1";
          ExcludeFilters = "";
          ExpandSearchResults = false;
          Filters = "";
          FollowSymLink = false;
          HiddenFiles = false;
          MatchCase = false;
          Place = 1;
          Recursive = true;
          Replaces = "";
          Search = "";
          SearchAsYouTypeAllProjects = true;
          SearchAsYouTypeCurrentFile = true;
          SearchAsYouTypeFolder = true;
          SearchAsYouTypeOpenFiles = true;
          SearchAsYouTypeProject = true;
          SearchDiskFiles = "";
          SearchDiskFiless = "";
          SizeLimit = 128;
          UseRegExp = false;
        };
      };
    };
  };
}
