{ pkgs, ... }:

{
  home.file.".local/share/wallpapers".source = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "wallpapers";
    rev = "0cea4a28451851a637762dec07ec4fb2bfebc421";
    hash = "sha256-B2ncT2qPc0inHHcO1BAZW5of+K0sIdtPcdpqcPUbKBo=";
  };

  home.file.".config/scripts/chpaper.sh" = {
    text = ''
      #!/bin/sh

      set -eu

      DIR="''${HOME}/.local/share/wallpapers"

      random_paper() {
      	find "''${DIR}"/ -type f -regextype egrep -regex ".*\.(jpe?g|png)$" | shuf -n1
      }

      SWAYSOCK="''${SWAYSOCK:-""}"
      if [ -z "''${SWAYSOCK}" ] ; then
      	SWAYSOCK="$(find /run/user/"$(id -u)"/ -name "sway-ipc.$(id -u).*.sock")"
      	export SWAYSOCK
      fi
      ${pkgs.imagemagick}/bin/convert "$(random_paper)" /tmp/wallpaper.jpg && swaymsg "output * bg '/tmp/wallpaper.jpg' fill" &
      ${pkgs.imagemagick}/bin/convert "$(random_paper)" /tmp/lockpaper.jpg
    '';
    executable = true;
  };
}
