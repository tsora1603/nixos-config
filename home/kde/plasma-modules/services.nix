# Locale, indexing, activities, devices, web shortcuts, wallet, and notifications.
{ ... }:
{
  programs.plasma = {
    configFile = {
      plasma-localerc.Formats.LANG = "en_US.UTF-8";
      # System services, activities, notifications, and miscellaneous
      kded5rc.Module-device_automounter.autoload = false;
      kuriikwsfilterrc.General = {
        EnableWebShortcuts = true;
        KeywordDelimiter = ":";
        PreferredWebShortcuts = "";
        UsePreferredWebShortcutsOnly = false;
      };
      powerdevil.AC.autoSuspend = {
        action = "nothing";
      };
    };
  };
}
