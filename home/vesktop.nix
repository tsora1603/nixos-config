{ ... }:
{
  programs.vesktop = {
    enable = true;
    settings = { 
      appBadge = true;
      arRPC = true;
      checkUpdates = true;
      customTitleBar = true;
      minimizeToTray = true;
      tray = true;
      splashTheming = true;
      staticTitle = true;
      hardwareAcceleration = true;
      discordBranch = "stable";
    };
  };
}
