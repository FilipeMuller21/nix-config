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
  ];

  #steam support

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.neovim.enable = true;
  programs.obs-studio.enable = true;

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    # Optional: Pin a specific version (e.g., postgresql_16, postgresql_17)
    # package = pkgs.postgresql_16; 
    
    # Automatically create databases on rebuild
    ensureDatabases = [ "my_database" ];
    
    # Allow local users to connect
    authentication = pkgs.lib.mkOverride 10 ''
      #type database DBuser auth-method
      local all       all     trust
    '';
  };


}

