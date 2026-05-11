{ config, pkgs, ... }: {

  users.users.grimnir = {
    isNormalUser = true;
    description = "grimnir";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };



}
