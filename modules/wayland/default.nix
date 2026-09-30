{ config, pkgs, pkgs-stable, ... }:

{
  imports = [
    ./ly.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config.common.default = [ "gnome" "gtk" ];
  }; 

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";

    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    GTK_BACKEND = "wayland,x11,*";
    CLUTTER_BACKEND = "wayland";
    SDL_VIDEODRIVER = "wayland";

    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland
    xwayland-satellite

    pkgs-stable.swaylock
    pkgs-stable.kdePackages.okular

    libreoffice
    vlc
    fuzzel
    swww
  ];

}
