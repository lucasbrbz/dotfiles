{ config, pkgs, ... }:

{
	boot = {
		# Bootloader.
		loader.grub = {
			enable = true;
			device = "/dev/vda";
			useOSProber = true;
		};

		# Use latest kernel.
		kernelPackages = pkgs.linuxPackages_latest;
	};
}