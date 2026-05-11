{ config, pkgs, ... }:{

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.gwenview
    kdePackages.ark
    kdePackages.kservice
    kdePackages.kde-cli-tools
    kdePackages.plasma-workspace	
    xdg-utils
    shared-mime-info 
  ];
}
