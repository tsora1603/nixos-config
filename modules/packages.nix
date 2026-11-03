{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  unstable = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # KDE Utilities
    kdePackages.discover      # Software center for Flatpaks/firmware updates
    kdePackages.kcalc         # Calculator
    kdePackages.kcharselect   # Character map
    kdePackages.kclock        # Clock app
    kdePackages.kcolorchooser # Color picker
    kdePackages.kdenlive      # Video editor
    kdePackages.kolourpaint   # Simple paint program
    kdePackages.ksystemlog    # System log viewer
    kdePackages.sddm-kcm      # SDDM configuration module
    kdiff3                    # File/directory comparison tool

    # Hardware/System Utilities (Optional)
    kdePackages.partitionmanager # Disk and partition management
    hardinfo2                    # System benchmarks and hardware info
    wayland-utils                # Wayland diagnostic tools
    wl-clipboard                 # Wayland copy/paste support
    vlc                          # Media player
    wget
    ntfs3g

    # Zen Browser flake
    inputs.zen-browser.packages.${system}.twilight

    # Telegram
    telegram-desktop

    # Other stuff
    steam-run # to run FHS applications/scripts
    mangojuice
    mangohud
    parsec-bin
    yacreader
    hydralauncher
    bitwarden-desktop
    qbittorrent-enhanced
    lm_sensors # for fastfetch
    pciutils   # for fastfetch
    unar # for .rar
    _7zip-zstd-rar
    lsfg-vk
    vulkan-tools
    zoom-us
    protonplus
    libreoffice

    # pixora-icons stuff
    parallel
    imagemagick
    vtracer
    scour
    (python3.withPackages (ps: [
      ps.lxml
    ]))
  ];

  programs.fish.enable = true;
}
