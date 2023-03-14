{ pkgs, ... }:

{
  xdg.configFile."scripts/power_menu.sh" = {
    text = ''
      #!/bin/sh

      set -eu

      chpower() {
      	case "$1" in
      		"")
      		;;
      		Shutdown)
      			exec systemctl poweroff
      		;;
      		Reboot)
      			exec systemctl reboot
      		;;
          Hibernate)
            exec systemctl hibernate
          ;;
      		Logout)
      			swaymsg exit
      		;;
      		*)
      			${pkgs.libnotify}/bin/notify-send -t 1500 -u low "Invalid Option"
      		;;
      	esac
      }

      OPTIONS="Shutdown\nReboot\nHibernate\nLogout"

      chpower "$(printf "%b" "$OPTIONS" | sort | ${pkgs.rofi-wayland}/bin/rofi -dmenu -p "Power Menu")"
    '';
    executable = true;
  };

  xdg.configFile."scripts/volume_up.sh" = {
    text = ''
      #!/bin/sh

      set -eu

      ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
      [ $(${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F': ' '{print $2}' | sed 's/\.//') -lt 100 ] && ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    '';
    executable = true;
  };

  xdg.configFile."scripts/tmux_sessions.sh" = {
    text = ''
      #!/bin/sh

      set -eu

      SESSION="$(${pkgs.tmux}/bin/tmux list-sessions -F "(#{session_attached}) #S [#{pane_current_command} in #{pane_current_path}] #{pane_title}" | sort | ${pkgs.rofi-wayland}/bin/rofi -dmenu -p "Running TMUX Sessions" | awk '{print $2}')"
      case "$SESSION" in
      	"")
      		;;
      	*)
      		${pkgs.kitty}/bin/kitty ${pkgs.tmux}/bin/tmux -u attach-session -dEt "$SESSION"
      		;;
      esac'';
    executable = true;
  };
}
