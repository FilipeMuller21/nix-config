{ inputs, pkgs, ... }:{

  environment.systemPackages = with pkgs; [
    neovim
    ghostty
    git
    wget
    curl
    spotify
    xwayland
    xwayland-satellite
    spotify
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  #steam support

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
