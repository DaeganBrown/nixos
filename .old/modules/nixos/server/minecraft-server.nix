{ pkgs, ... }:

{
  systemd.services.minecraft-restart = {
  description = "Restart Minecraft Docker Compose server";

  serviceConfig = {
    Type = "oneshot";
    WorkingDirectory = "/home/admin/minecraft/servers/sevtech-ages/";
  };

  script = ''
    ${pkgs.docker}/bin/docker compose exec -T mc rcon-cli save-all
    ${pkgs.docker}/bin/docker compose restart mc
  '';
};

systemd.timers.minecraft-restart = {
  description = "Daily Minecraft server restart";

  wantedBy = [ "timers.target" ];

  timerConfig = {
    OnCalendar = "*-*-* 03:00:00";
    Persistent = true;
  };
};
}
