{ config, pkgs, ... }:

{
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users = {
		users = {
			lucas-barboza = {
				isNormalUser = true;
				description = "Lucas";
				extraGroups = [ 
					"networkmanager" 
					"wheel" 
                ];
                packages = with pkgs; [
                    emacs
                    i3
                    brave
                    alacritty
                ];
			};
		};
	};
}