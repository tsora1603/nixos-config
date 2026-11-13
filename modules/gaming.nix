{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.lsfg-vk.overlays.default
  ];

  services.playit = {
    enable = true;
    secretPath = "/etc/playit/secret.toml";
  };

  environment.systemPackages = with pkgs; [
    temurin-bin
    openssl
  ];

  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };

  programs.appimage = {
    enable = true;
    binfmt = true; # Allows launching .AppImage files directly.
  };
}
