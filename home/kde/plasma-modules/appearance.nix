# KDE colors, fonts, icon theme, splash screen, and titlebar colors.
{ pkgs, ... }:
{
  programs.plasma = {
    configFile = {
      kdeglobals = {
        General = {
          AccentColor = "150,112,58";
          LastUsedCustomAccentColor = "150,112,58";
          TerminalApplication = "${pkgs.ghostty}/bin/ghostty --gtk-single-instance=true";
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
    };
  };
}
