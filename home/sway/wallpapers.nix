{ pkgs, ... }:

{
  xdg.dataFile."wallpapers/catppuccin".source = "${pkgs.catppuccin-wallpapers}/share/wallpapers";
  xdg.configFile."scripts/chpaper.sh" = {
    text = ''
      #!/bin/sh

      set -eu

      DIR="''${HOME}/.local/share/wallpapers"

      random_paper() {
        find -L "''${DIR}"/ -type f -regextype egrep -regex ".*\.(jpe?g|png)$" | shuf -n1
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
