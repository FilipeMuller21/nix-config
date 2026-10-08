{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    yazi
    ffmpegthumbnailer
    poppler
    chafa
    thunar
    thunar-volman
    thunar-archive-plugin
    thunar-media-tags-plugin
    
    # Appearance packages
    gnome-themes-extra
    adwaita-icon-theme
    papirus-icon-theme
    arc-theme
    materia-theme
    lxappearance
    xfce.thunar
    xfce.xfconf
    
    # Media applications
    imv
    mpv
    evince
    file-roller
  ];

  services.gvfs.enable = true;
  services.tumbler.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common.default = [ "gtk" ];
    };
  };

  xdg.mime.enable = true;
  
  # Default applications for different media types
  xdg.mime.defaultApplications = {
    "image/jpeg" = "imv.desktop";
    "image/png" = "imv.desktop";
    "image/gif" = "imv.desktop";
    "image/webp" = "imv.desktop";
    "image/svg+xml" = "imv.desktop";
    "video/mp4" = "mpv.desktop";
    "video/x-matroska" = "mpv.desktop";
    "video/webm" = "mpv.desktop";
    "video/avi" = "mpv.desktop";
    "video/quicktime" = "mpv.desktop";
    "application/pdf" = "org.gnome.Evince.desktop";
    "application/zip" = "file-roller.desktop";
    "application/x-7z-compressed" = "file-roller.desktop";
    "application/x-rar" = "file-roller.desktop";
    "application/x-tar" = "file-roller.desktop";
    "application/gzip" = "file-roller.desktop";
  };

}
