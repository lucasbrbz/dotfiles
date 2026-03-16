{ config, pkgs, ... }:

{
	services = {
		# Enable the OpenSSH daemon.
		openssh.enable = true;
		# Enable X11 server for graphics.
		xserver = {
			enable = true;
			# videoDrivers = [ "nvidia" ];
			# Configure keymap in X11.
			xkb = {
				layout = "br";
				variant = "";
			};
			# Configure i3 window manager.
			windowManager.i3 = {
				enable = true;
				extraPackages = with pkgs; [
					dmenu
					i3status
					i3blocks
				];
			};
		};
		# Set default session to i3.
		displayManager = {
			defaultSession = "none+i3";
			autoLogin.user = "lucas-barboza";
		};
	};
}