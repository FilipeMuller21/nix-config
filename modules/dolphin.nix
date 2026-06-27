{ config, pkgs, ... }:{

  environment.systemPackages = with pkgs; [
    lxappearance
    kdePackages.dolphin
    kdePackages.gwenview
    kdePackages.ark
    kdePackages.kservice
    kdePackages.kde-cli-tools
    kdePackages.plasma-workspace
    kdePackages.polkit-kde-agent-1   
    kdePackages.qt6ct
    kdePackages.breeze-icons
    kdePackages.xdg-desktop-portal-kde
    kdePackages.kleopatra
    kdePackages.kio-extras
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs
   # kdePackages.full
    xdg-utils
    shared-mime-info 
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qt5ct 
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.kio
    materia-theme
    adwaita-qt
    adwaita-qt6
    vlc
  ];

  nixpkgs.config.qt6 = {
    enable = true;
    platformTheme = "qt6ct"; 
      style = {
        package = pkgs.utterly-nord-plasma;
        name = "Utterly Nord Plasma";
      };
  };
  environment.variables.QT_QPA_PLATFORMTHEME = "qt6ct";
}
