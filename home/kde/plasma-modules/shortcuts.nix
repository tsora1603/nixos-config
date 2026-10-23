# Global shortcuts: KWin, Plasma, sessions, accessibility, media, and apps.
{ ... }:
{
  programs.plasma = {
    shortcuts = {
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
        "Switch to Next Screen" = "Meta+Ctrl+Return";
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
        "Switch Window Down" = [ "Meta+Down" "Meta+Alt+Down" ];
        "Switch Window Left" = [ "Meta+Left" "Meta+Alt+Left" ];
        "Switch Window Right" = [ "Meta+Right" "Meta+Alt+Right" ];
        "Switch Window Up" = [ "Meta+Up" "Meta+Alt+Up" ];
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
        "Window Grow Horizontal" = "Meta+Ctrl++";
        "Window Grow Vertical" = [ ];
        "Window Lower" = [ ];
        "Window Maximize" = [ "Meta+Space" "Meta+PgUp" ];
        "Window Maximize Horizontal" = [ ];
        "Window Maximize Vertical" = [ ];
        "Window Minimize" = "Meta+PgDown";
        "Window Move" = [ ];
        "Window Move Center" = "Meta+Alt+Return";
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
        "Window Pack Left" = "Meta+Shift+Home";
        "Window Pack Right" = "Meta+Shift+End";
        "Window Pack Up" = [ ];
        # Move and resize the active window into a screen region.
        "Window Quick Tile Bottom" = "Meta+Shift+Down";
        "Window Quick Tile Bottom Left" = [ ];
        "Window Quick Tile Bottom Right" = [ ];
        "Window Quick Tile Left" = "Meta+Shift+Left";
        "Window Quick Tile Right" = "Meta+Shift+Right";
        "Window Quick Tile Top" = "Meta+Shift+Up";
        "Window Quick Tile Top Left" = [ ];
        "Window Quick Tile Top Right" = [ ];
        "Window Raise" = [ ];
        "Window Resize" = "Meta+R";
        "Window Shrink Horizontal" = "Meta+Ctrl+-";
        "Window Shrink Vertical" = [ ];
        # Transfer the active window; the destination desktop must exist.
        "Window to Desktop 1" = "Meta+1";
        "Window to Desktop 10" = "Meta+0";
        "Window to Desktop 11" = "Meta+Ctrl+Shift+F11";
        "Window to Desktop 12" = "Meta+Ctrl+Shift+F12";
        "Window to Desktop 13" = [ ];
        "Window to Desktop 14" = [ ];
        "Window to Desktop 15" = [ ];
        "Window to Desktop 16" = [ ];
        "Window to Desktop 17" = [ ];
        "Window to Desktop 18" = [ ];
        "Window to Desktop 19" = [ ];
        "Window to Desktop 2" = "Meta+2";
        "Window to Desktop 20" = [ ];
        "Window to Desktop 21" = [ ];
        "Window to Desktop 22" = [ ];
        "Window to Desktop 23" = [ ];
        "Window to Desktop 24" = [ ];
        "Window to Desktop 25" = [ ];
        "Window to Desktop 3" = "Meta+3";
        "Window to Desktop 4" = "Meta+4";
        "Window to Desktop 5" = "Meta+5";
        "Window to Desktop 6" = "Meta+6";
        "Window to Desktop 7" = "Meta+7";
        "Window to Desktop 8" = "Meta+8";
        "Window to Desktop 9" = "Meta+9";
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
      };
      # Desktop and session
      plasmashell = {
        "Slideshow Wallpaper Next Image" = [ ];
        "activate application launcher" = [ ];
        "activate widget 485" = [ "Meta" ]; # Search (org.kde.milou)
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

    # Plasma also reads the shortcut from the widget's own configuration.
    # These IDs identify the existing Search widget; recreating it changes them.
    configFile."plasma-org.kde.plasma.desktop-appletsrc".
      "Containments/428/Applets/485/Shortcuts".global = "Meta";
  };
}
