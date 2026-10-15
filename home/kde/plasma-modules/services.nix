# Locale, indexing, activities, devices, web shortcuts, wallet, and notifications.
{ ... }:
{
  programs.plasma = {
    configFile = {
      plasma-localerc.Formats.LANG = "en_US.UTF-8";
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
  };
}
