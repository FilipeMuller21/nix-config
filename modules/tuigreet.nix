{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tuigreet
  ];

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "grimnir";
      };
    };
  };
}
