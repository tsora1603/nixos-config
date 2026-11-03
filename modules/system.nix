{ pkgs, ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/533c7954-2111-4c8d-a6c8-054983eb9878";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E251-7799";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/c1d8f42d-d665-4d3b-bc0b-68d5ec7995a5"; }
  ];

  fileSystems."/mnt/backup" = {
    device = "/dev/disk/by-label/backup";
    fsType = "ext4";
    options = [ "nofail" ];
  };

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

  environment.localBinInPath = true;
}
