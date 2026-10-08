{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware/hardware-configuration.nix
      ./hardware/nvidia.nix	
      ./modules/users.nix
      ./modules/tuigreet.nix
      ./modules/bluetooth.nix
#      ./modules/dolphin.nix
      ./modules/noctalia.nix
      ./modules/apps.nix
      ./modules/niri.nix
      ./modules/zsh.nix
      ./modules/spicetify.nix
    #  ./modules/minecraft.nix
       ./modules/nixvim.nix
       ./modules/doom-emacs.nix
       ./modules/file-managers.nix
 ];

  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    timeout = 20;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      gfxmodeEfi = "1920x1080x32";
      theme = pkgs.runCommand "cybergrub-2077" { } ''
        mkdir -p $out
        cp -r ${inputs.cybergrub-theme}/CyberGRUB-2077/. $out/
	chmod -R u+w $out
	cp -f ${inputs.cybergrub-theme}/img/logos/nixos.png $out/logo.png
      '';
    };
  };

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


systemd.user.services.xdg-desktop-portal-gnome.environment = {
  COGL_DRIVER = "gl";
  GSK_RENDERER = "gl";
};

  }
