# NixOS configuration

Personal x86_64-linux configuration for `hephaestus`, using
NixOS 26.05, Home Manager and Plasma Manager.

## Validate

```sh
nix flake check --no-build --no-write-lock-file
nix build --no-link --no-write-lock-file .#tidaler
```

The first command evaluates the configuration. The second builds
Tidaler and runs its CLI and offscreen GUI smoke checks.

## Apply

Review hardware-configuration.nix before using this on another machine.

```sh
sudo nixos-rebuild test --flake .#hephaestus
sudo nixos-rebuild switch --flake .#hephaestus
```

Log out and back in after changing the floating-panel patch.

## Layout

- configuration.nix: system services and packages
- hardware-configuration.nix: machine-specific storage and hardware
- home/: user applications, shell and desktop settings
- packages/: locally maintained packages
- themes/ and wallpapers/: assets installed through Home Manager

Assets are copied into the Nix store; changes require a rebuild.
The `nh` shortcut configuration expects the checkout at ~/nixos.
Use `nxh` to enter its home/ directory.

Theme downloads are pinned by revision and hash. Steam's base
stylesheet is bundled at build time and needs no runtime download.

Automatic locking starts after ten minutes. Manually installed
Flatpaks are preserved.

Do not bump system.stateVersion or home.stateVersion as part of
routine package updates.