{ inputs, lib, ... }:

let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };

  defaults = builtins.fromTOML (
    builtins.readFile "${unstable.umbriel.src}/examples/config.toml"
  );
in
{
  imports = [
    "${unstable.noctalia.src}/nix/home-module.nix"
    "${unstable.umbriel.src}/nix/home-module.nix"
  ];

  programs.noctalia = {
    enable = true;
    package = unstable.noctalia;

    # Umbriel starts Noctalia specifically for its own session.
    systemd.enable = false;
  };

  programs.umbriel = {
    enable = true;

    settings = lib.recursiveUpdate defaults {
      general.autostart = [ "noctalia" ];

      # Keep upstream shortcuts, but launch Ghostty instead of Kitty.
      keybinds."Mod+Return".action =
        lib.replaceStrings
          [ "kitty" ]
          [ "ghostty" ]
          defaults.keybinds."Mod+Return".action;

      keybinds."Mod+Space" = "window-toggle-maximize-to-edges";
    };
  };
}