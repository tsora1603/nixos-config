{ ... }:

{
  virtualisation.docker.enable = true;

  virtualisation.oci-containers = {
    backend = "docker";
    containers.bedrock = {
      image = "itzg/minecraft-bedrock-server";

      networks = [ "host" ];

      volumes = [ "/srv/minecraft:/data" ];

      environment = {
        TRANSPORT = "nethernet";
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

  networking.firewall.allowedUDPPorts = [ 19133 ];
  networking.firewall.allowedUDPPortRanges = [ { from = 19143; to = 19152; } ];
}
