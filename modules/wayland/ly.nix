{ config, pkgs, ... }:

  let
    fondodur= ./fondodur.dur;
  in
  {
    services.displayManager.ly.enable = true;

    environment.etc."ly/config.lua".text = ''
      ly = {
        animation = "dur",
	dur_file_path = "${fondodur}",
	dur_offset_aligment = "center",
	full_color = true,
	animation_timeout_sec = 0,
      }
    '';
  }

