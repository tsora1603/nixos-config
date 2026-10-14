{ ... }:
{
  programs.fastfetch.enable = true;

  # Mirrors the old ~/.config/fastfetch exactly (config, logo, scripts)
  xdg.configFile."fastfetch" = {
    source = ./fastfetch;
    recursive = true;
  };
}
