{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.millennium.overlays.default
    inputs.lsfg-vk.overlays.default
  ];

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
  };

  programs.appimage = {
    enable = true;
    binfmt = true; # Allows launching .AppImage files directly.
  };

  # Minecraft Bedrock server
  virtualisation.docker.enable = true;

  virtualisation.oci-containers = {
    backend = "docker";
    containers.bedrock = {
      image = "itzg/minecraft-bedrock-server";
      ports = [
        "19132:19132/udp"
        "19132:19132/tcp"
      ];
      volumes = [ "/srv/minecraft:/data" ];
      environment = {
        ALLOW_LIST = "false";
        EULA = "TRUE";
        VERSION = "LATEST";
        SERVER_NAME = "My NixOS Server";
        GAMEMODE = "survival";
        DIFFICULTY = "hard";
        MAX_PLAYERS = "10";
        ALLOW_CHEATS = "false";
        TZ = "America/Sao_Paulo";
      };
    };
  };

  # Create the world/data directory
  systemd.tmpfiles.rules = [ "d /srv/minecraft 0755 root root -" ];

  # Bedrock with NetherNet needs TCP (signalling) and UDP (gameplay)
  networking.firewall.allowedTCPPorts = [ 19132 ];
  networking.firewall.allowedUDPPorts = [ 19132 ];
}
