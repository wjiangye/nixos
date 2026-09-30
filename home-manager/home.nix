{ config, pkgs, username, ... }:

{
  imports = [

  ];

  home.username = "${username}";
  home.homeDirectory = "/home/s4yok";

  home.packages = with pkgs; [
    foot
    cmatrix
    quickshell
    
    llama-cpp-vulkan
  ];

  programs.git = {
    enable = true;
    userName = "${username}";
    userEmail = "s4yok@nixos.btw";
  }:

  programs.bash.enable = true;

}
