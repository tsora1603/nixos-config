# Keyboard layout, pointer acceleration, cursor size/theme, and NumLock.
{ ... }:
{
  programs.plasma = {
    configFile = {
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
    };
  };
}
