{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    yazi
    ffmpegthumbnailer
    poppler
    chafa
    thunar
    thunar-volman
    thunar-archive-plugin
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

}
