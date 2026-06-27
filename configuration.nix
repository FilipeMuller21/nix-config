{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware/hardware-configuration.nix
      ./hardware/nvidia.nix	
      ./modules/users.nix
      ./modules/tuigreet.nix
      ./modules/bluetooth.nix
      ./modules/dolphin.nix
      ./modules/noctalia.nix
      ./modules/apps.nix
      ./modules/niri.nix
      ./modules/zsh.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };
  nixpkgs.config.allowUnsupportedSystem = true;
  console.keyMap = "br-abnt2";

  environment.systemPackages = with pkgs; [
	ghostty
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";


  #minecraft time

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
}
