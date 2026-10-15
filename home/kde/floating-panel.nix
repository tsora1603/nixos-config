{ pkgs, lib, ... }:

let
  dependencies = with pkgs; [
    bash
    coreutils
    findutils
    gnugrep
    gnused
    gawk
    systemd
    kdePackages.kpackage
    kdePackages.kconfig
    kdePackages.qttools
  ];

  installer = ../../scripts/plasma-always-floating-panel-patch;

  bootstrap = pkgs.writeShellScript "install-floating-panel" ''
    export PATH="${lib.makeBinPath dependencies}:$PATH"

    # Install only if the patch is missing.
    if [ ! -f "$HOME/.local/share/plasma/shells/org.kde.plasma.desktop/.plasma-always-floating-panel-patch" ]; then
      ${pkgs.bash}/bin/bash ${installer} install
    fi
  '';
in
{
  systemd.user.services.plasma-floating-bootstrap = {
    Unit = {
      Description = "Install always-floating Plasma panel patch";
      After = [ "plasma-plasmashell.service" ];
      PartOf = [ "plasma-workspace.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${bootstrap}";
    };

    Install.WantedBy = [ "plasma-workspace.target" ];
  };
}
