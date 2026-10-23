# KWin window management, native tiling, effects, and window rules.
{ pkgs, ... }:
{
  programs.plasma = {
    enable = true;
    startup.startupScript."screen-scaling" = {
      runAlways = true;
      text = ''
        ${pkgs.kdePackages.libkscreen}/bin/kscreen-doctor \
          output.DP-1.rotation.none \
          output.DP-1.position.0,260 \
          output.HDMI-A-2.rotation.right \
          output.HDMI-A-2.position.3440,0
      '';
    };
    configFile = {
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
        Plugins.minimizeallEnabled = true;
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
        "org.kde.kdecoration2" = {
          library = "org.kde.kwin.aurorae";
          theme = "Plasma-Overdose-KWinDeco";
        };
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
          noborder = false;
          noborderrule = 2;
          wmclass = "steam";
          wmclasscomplete = false;
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
    };
  };
}
