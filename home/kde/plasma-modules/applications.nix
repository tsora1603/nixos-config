# Dolphin, Kate, Spectacle, and file dialog preferences.
{ ... }:
{
  programs.plasma = {
    configFile = {
      kdeglobals = {
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
      };
      # Applications — Dolphin, Kate, Spectacle, and file dialogs
      dolphinrc = {
        CompactMode.PreviewSize = 16;
        DetailsMode.PreviewSize = 22;
        "KFileDialog Settings" = {
          "Places Icons Auto-resize" = false;
          "Places Icons Static Size" = 22;
        };
      };
      katerc = {
        General = {
          "Days Meta Infos" = 30;
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
        VideoSave.translatedScreencastsFolder = "Screencasts";
      };
      kiorc.Confirmations.ConfirmEmptyTrash = true;
    };
  };
}
