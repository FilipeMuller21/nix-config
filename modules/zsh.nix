{ config, lib, pkgs, ... } : {

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    zsh-autoenv.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "darkblood";
      plugins = [
        "git"
	"npm"
	"history"
	"node"
	"rust"
	"deno"
      ];
    };   
    
    interactiveShellInit = "fastfetch";
  };




}
