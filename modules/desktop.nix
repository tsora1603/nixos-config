{ config, pkgs, ... }:

{
  # Graphics acceleration, including 32-bit games
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  fonts.packages = [ pkgs.cozette pkgs.nerd-fonts.departure-mono ];

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
  };
  services.flatpak.enable = true;
  services.tailscale.enable = true;

  programs.qylock = {
    enable = true;
    theme = "nier-automata";
    sddm.enable = true;
    quickshell.enable = false;
  };

  # Add the Flathub remote so Discover has a Flatpak source.
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    path = [ pkgs.flatpak ];
    serviceConfig.Type = "oneshot";
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Prevents KDE from overriding Qylock theme
  environment.etc."sddm.conf.d/zz-qylock.conf".text = ''
    [Theme]
    Current=${config.services.displayManager.sddm.theme}
  '';

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa          # Audio player
    kdePackages.kdepim-runtime # Akonadi agents
    kdePackages.kmahjongg
    kdePackages.kmines
    kdePackages.konversation   # IRC client
    kdePackages.kpat           # Solitaire
    kdePackages.ksudoku
    kdePackages.ktorrent
    kdePackages.plasma-workspace-wallpapers
  ];
}
