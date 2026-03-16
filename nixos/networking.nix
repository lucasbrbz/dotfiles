{ config, pkgs, ... }:

{
	networking = {
 		# Define your hostname.
		hostName = "nixos";
		# Enables wireless support via wpa_supplicant.
		# wireless.enable = true;
		# Enable networking.
		networkmanager.enable = true;
		# Disable the firewall.
		firewall.enable = false;
	};
}