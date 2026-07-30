{ inputs, config, pkgs, lib, ... }:{




services.minecraft-server = {
  enable = true;
  eula = true;
  openFirewall = true; # Opens the port the server is running on (by default 25565 but in this case 43000)
  declarative = true; 
  serverProperties = {
    server-port = 43000;
    difficulty = 3;
    gamemode = 0;
    force-gamemode = true;
    max-players = 5;
    motd = "NixOS Minecraft server!";
    white-list = false;
    allow-cheats = true;
    online-mode = false;
  };
  jvmOpts = "-Xms2048M -Xmx2048M"; 
};
  systemd.services.minecraft-server.wantedBy = lib.mkForce [];
}
