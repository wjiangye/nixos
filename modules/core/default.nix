{ config, pkgs, hostname, ... }:

{
  networking.hostName = "${hostname}";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.polkit.enable = true;
  security.pam.services.swaylock = true;

  environment.systemPackages = [
    pkgs-stable.pcutils
    pkgs-stable.usbutils
    pkgs-stable.dnsutils
  ];

  services.udisks2.enable = true;
  services.gvfs.enable = true;

}
