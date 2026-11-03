# Desktop and lock-screen wallpapers.
{ ... }:
{
  programs.plasma = {
    workspace.wallpaper = [
      "/home/tsora/Pictures/Wallpapers/MONITOR1/Astral_Grave/wallhaven-l8xwdp_3440x1440.png"
      "/home/tsora/Pictures/Wallpapers/MONITOR2/Permanent/old-pc.png"
    ];
    configFile = {
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
    };
  };
}
