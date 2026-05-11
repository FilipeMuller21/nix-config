{ config, lib, pkgs, ... } : {


  environment.systemPackages = with pkgs; [
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      theme = "arrow";
    };    
  };
}
