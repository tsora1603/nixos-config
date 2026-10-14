# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    # Include the results of the hardware scan.
    # NOTE: with flakes, this file must be tracked by git (`git add`).
    ./hardware-configuration.nix
  ];

  nixpkgs.overlays = [
    inputs.millennium.overlays.default
  ];

  fileSystems."/mnt/backup" = {
    device = "/dev/disk/by-label/Backup";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Fish as the login shell (home-manager's programs.fish only configures it).
  programs.fish.enable = true;

  users.users.tsora = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
    packages = with pkgs; [
      tree
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.tsora = import ./home;
  };

  fonts.packages = [ pkgs.cozette pkgs.nerd-fonts.departure-mono ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "hephaestus"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone (defaults to UTC until you set this), e.g.:
  time.timeZone = "America/Sao_Paulo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    packages = [ pkgs.terminus_font ];
    font = "ter-v24n";
    useXkbConfig = true; # keymap comes from services.xserver.xkb.*
  };

  # System-level keyboard layout (used by the TTY and the SDDM login screen).
  # Change this to match the layout you use in Plasma, e.g. "br".
  services.xserver.xkb = {
    layout = "us";
    # variant = "";
    # options = "caps:escape";
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;

      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };
    flatpak.enable = true;
    fwupd.enable = true;
  };

  programs = {
    steam.enable = true;
    steam.package = pkgs.millennium-steam;
    qylock = {
      enable = true;
      theme = "pixel-hollowknight";
      sddm.enable = true;
      quickshell.enable = false;
    };
    appimage = {
      enable = true;
      binfmt = true; # lets you double-click/execute .AppImage files directly
    };
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # KDE Utilities
    kdePackages.discover      # Software center for Flatpaks/firmware updates
    kdePackages.kcalc         # Calculator
    kdePackages.kcharselect   # Character map
    kdePackages.kclock        # Clock app
    kdePackages.kcolorchooser # Color picker
    kdePackages.kolourpaint   # Simple paint program
    kdePackages.ksystemlog    # System log viewer
    kdePackages.karousel      # Scrollable tiling Kwin script
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
    (import ./packages/tidaler.nix { inherit pkgs; })
    parsec-bin
    yacreader
    hydralauncher
    bitwarden-desktop
    qbittorrent-enhanced
    lm_sensors # for fastfetch
    pciutils   # for fastfetch
  ];

  environment.localBinInPath = true;
  
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa          # Music player
    kdePackages.kdepim-runtime # Akonadi agents
    kdePackages.kmahjongg
    kdePackages.kmines
    kdePackages.konversation   # IRC client
    kdePackages.kpat           # Solitaire
    kdePackages.ksudoku
    kdePackages.ktorrent
    kdePackages.plasma-workspace-wallpapers
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Enable bluetooth.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery percentage of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This option defines the first version of NixOS you have installed on this
  # particular machine, and is used to maintain compatibility with application
  # data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for
  # any reason, even if you've upgraded your system to a new NixOS release.
  # See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  system.stateVersion = "26.05"; # Did you read the comment?
}
