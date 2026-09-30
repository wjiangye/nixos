{ config, pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    yazi
    gh

    eza
    bat
    ripgrep
    fd
    fzf
    jq

    fastfetch
    wl-clipboard
    grim
    slurp

  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  services.flatpak.enable = true;

}
