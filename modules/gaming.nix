{ pkgs, inputs, lib, ... }:

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


  # Minecraft Bedrock server
  virtualisation.docker.enable = true;

  virtualisation.oci-containers = {
    backend = "docker";
    containers.bedrock = {
      image = "itzg/minecraft-bedrock-server";

      ports = [
        "19142:19142/tcp"
        "19143-19152:19143-19152/udp"
      ];

      volumes = [ "/srv/minecraft:/data" ];

      environment = {
        SERVER_PORT = "19142";
        SERVER_UDP_PORTS = "127.0.0.1:19143-19152:19143-19152";

        LEVEL_NAME = "Os Okamas do Autista 251026 - Copy - Copy";
        ALLOW_LIST = "false";
        EULA = "TRUE";
        VERSION = "LATEST";
        SERVER_NAME = "Os Okamas do Autista";
        GAMEMODE = "survival";
        DIFFICULTY = "hard";
        MAX_PLAYERS = "10";
        ALLOW_CHEATS = "false";
        TZ = "America/Sao_Paulo";

        # WaterdogPE backend
        ONLINE_MODE = "false";
      };
    };
  };

  systemd.tmpfiles.rules = [ "d /srv/minecraft 0755 root root -" ];

  networking.firewall.allowedTCPPorts = [ 19132 19142 ];

  networking.firewall.allowedUDPPorts = [
    19133
  ] ++ (lib.range 19143 19152);
}
