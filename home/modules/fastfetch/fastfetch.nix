{ lib, ... }:
{
  programs.fastfetch.enable = true;

  # Mirrors the old ~/.config/fastfetch exactly (config, logo, scripts)
  xdg.configFile."fastfetch" = {
    source = lib.cleanSourceWith {
      src = ./.;
      # Install the assets alongside this module, excluding Nix source files.
      filter = path: type: type == "directory" || !(lib.hasSuffix ".nix" path);
    };
    recursive = true;
  };
}
