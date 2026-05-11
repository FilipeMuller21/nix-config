{ pkgs, ... }: {

	environment.systemPackages = with pkgs; [
		noctalia-shell
		waybar
	        fuzzel	
		mako
		awww
		wl-clipboard
		grim	
		slurp
		brightnessctl
		playerctl
		pamixer
		networkmanagerapplet
		fastfetch
		btop
	];
}
