# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  	imports = [
		# Include the results of the hardware scan.
		/etc/nixos/hardware-configuration.nix
		./boot.nix
		./networking.nix
		./environment.nix
		./users.nix
		./services.nix
	];

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.05"; # Did you read the comment?

	# Configure console keymap
	console.keyMap = "br-abnt2";

	# Set your time zone.
	time.timeZone = "America/Sao_Paulo";

	# Select internationalisation properties.
	i18n = {
		defaultLocale = "en_US.UTF-8";
		extraLocaleSettings = {
			LC_ADDRESS = "pt_BR.UTF-8";
			LC_IDENTIFICATION = "pt_BR.UTF-8";
			LC_MEASUREMENT = "pt_BR.UTF-8";
			LC_MONETARY = "pt_BR.UTF-8";
			LC_NAME = "pt_BR.UTF-8";
			LC_NUMERIC = "pt_BR.UTF-8";
			LC_PAPER = "pt_BR.UTF-8";
			LC_TELEPHONE = "pt_BR.UTF-8";
			LC_TIME = "pt_BR.UTF-8";
		};
	};


	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;
}
