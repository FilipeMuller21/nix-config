{ inputs, pkgs, config, ... }:{

  environment.systemPackages = with pkgs; [
    vscode.fhs
    git
    wget
    curl
    spotify
    xwayland
    xwayland-satellite
    spotify
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    unrar
    rar
    libreoffice
    prismlauncher
    nodejs
    python3
    mpv
    jq
    obsidian
    discord
    davinci-resolve
    opencode
];

  #steam support

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
 ## programs.neovim.enable = true;
  programs.obs-studio.enable = true;

 ## services.postgresql = {
  #enable = true;
 # package = pkgs.postgresql_16;

  #ensureDatabases = [ "my_database" ];

  #ensureUsers = [
   # {
   #   name = "grimnir";
   #   ensureDBOwnership = true;   # já te dá permissão total no banco com seu nome, se criar um "grimnir"
  #  }
  #];

  #authentication = pkgs.lib.mkOverride 10 ''
  #  #type database DBuser auth-method
  #  local all       all     trust
  #'';
#};


}

