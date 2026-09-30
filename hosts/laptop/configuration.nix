{ config, lib, pkgs, pkgs-stable, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Madrid";
  il8n.defaultLocale = "es_ES.UTF-8";
  console = {
    enable = true;
    packages = [ pkgs-stable.terminus_font ];
    font = "ter-u16n";
    keyMap = "es";
    useXkbConfig = false;
  };

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
    ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    tree
    curl
    wget
    unzip
    zip

    brightnessctl
    lm_sensors
    proton-vpn-cli
  ];

  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    libinput.enable = true;
    fwupd.enable = true;
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  system.stateVersion = "26.11";
}
