{ config, lib, pkgs, ... }:

let
  wallpaperScript =
    "${config.xdg.dataHome}/plasma-manager/"
    + "${config.programs.plasma.startup.dataDir}/"
    + "desktop_script_wallpaper_picture.js";

  qdbus = "${pkgs.kdePackages.qttools}/bin/qdbus";
in
{
  home.activation.reloadPlasmaWallpapers =
    lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      if [[ -z "''${DRY_RUN:-}" && -f "${wallpaperScript}" ]]; then
        runtime="''${XDG_RUNTIME_DIR:-/run/user/$(${pkgs.coreutils}/bin/id -u)}"

        if [[ -S "$runtime/bus" ]]; then
          echo "Hot-reloading Plasma wallpapers..."

          if ! XDG_RUNTIME_DIR="$runtime" \
            DBUS_SESSION_BUS_ADDRESS="unix:path=$runtime/bus" \
            ${qdbus} \
              org.kde.plasmashell \
              /PlasmaShell \
              org.kde.PlasmaShell.evaluateScript \
              "$(< "${wallpaperScript}")"; then

            echo "Wallpaper reload failed; Plasma will retry on login." >&2
          fi
        fi
      fi
    '';
}
