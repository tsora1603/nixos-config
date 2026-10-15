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

  runner = pkgs.writeShellScript "plasma-floating-panel" ''
    export PATH="${lib.makeBinPath dependencies}:$PATH"
    exec ${pkgs.bash}/bin/bash ${installer} "$@"
  '';
in
{
  home.file.".local/bin/plasma-always-floating-panel-patch".source =
    runner;

  systemd.user.services.plasma-always-floating-panel-patch = {
    Unit = {
      Description = "Refresh the always-floating Plasma panel patch";
      After = [ "graphical-session-pre.target" ];
      Before = [ "plasma-plasmashell.service" ];
      PartOf = [ "plasma-workspace.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${runner} refresh";
    };

    Install.WantedBy = [ "plasma-workspace.target" ];
  };

  systemd.user.services.plasma-floating-bootstrap = {
    Unit = {
      Description = "Configure floating panels and resize snapping";
      After = [
        "plasma-plasmashell.service"
        "plasma-always-floating-panel-patch.service"
      ];
      PartOf = [ "plasma-workspace.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${runner} install --no-restart";
    };

    Install.WantedBy = [ "plasma-workspace.target" ];
  };
}
