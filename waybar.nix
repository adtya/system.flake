{ pkgs, ... }:

{
  home-manager.users.adtya = { pkgs, ... }: {
    programs.waybar.enable = true;
    programs.waybar.systemd.enable = true;
    programs.waybar.style = ''
      @define-color background	#282a36;
      @define-color foreground	#f8f8f2;
      @define-color selection		#44475a;
      @define-color unfocused		#6272a4;
      @define-color red			#ff5555;
      @define-color green			#50fa7b;
      @define-color yellow		#f1fa8c;
      @define-color cyan			#8be9fd;
      @define-color purple		#bd93f9;
      @define-color pink			#ff79c6;
      @define-color orange		#ffb86c;

      * {
      	border: none;
      	border-radius: 0px;
      	font-family: 'FiraCode Nerd Font Mono';
      	font-size: 16px;
      	min-height: 0;
      }

      #window {
      	padding: 0px 10px;
      	background: @background;
      }

      window#waybar {
      	background: @background;
      	color: @foreground;
      }

      window#waybar.hidden {
      	opacity: 0.2;
      }

      window#waybar.empty {
      	background: @background;
      }
      window#waybar.solo {
      	background: @background;
      }

      #workspaces button {
      	padding: 0px 3px;
      	background: @background;
      	color: @foreground;
      }

      #workspaces button.focused {
      	color: @green;
      }

      #workspaces button.urgent {
      	background: @background;
      	color: @red;
      }

      #mode {
      	background: @background;
      	border: 3px solid @purple;
      }

      #clock, #battery, #backlight, #network, #pulseaudio, #tray, #mode, #idle_inhibitor, #bluetooth {
      	padding: 0 10px;
      	color: @foreground;
      	background-color: @background;
      }

      @keyframes blink{
      	to {
      		color: @foreground;
      	}
      }

      #battery.warning {
      	color: @yellow;
      	animation-name: blink;
      	animation-duration: 1s;
      	animation-timing-function: linear;
      	animation-iteration-count: infinite;
      	animation-direction: normal;
      }

      #battery.critical {
      	color: @red;
      	animation-name: blink;
      	animation-duration: 1s;
      	animation-timing-function: linear;
      	animation-iteration-count: infinite;
      	animation-direction: normal;
      }

      #battery.charging {
      	color: @green;
      	animation-name: blink;
      	animation-duration: 1s;
      	animation-timing-function: linear;
      	animation-iteration-count: infinite;
      	animation-direction: normal;
      }

      label:focus {
      	background-color: @selection;
      }

      #temperature.critical {
      	color: @red;
      }
      #idle_inhibitor.activated {
      	color: @green;
      }
    '';
    programs.waybar.settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 28;
        modules-left = [ "sway/workspaces" "sway/window" "sway/mode" ];
        modules-center = [ ];
        modules-right = [ "tray" "idle_inhibitor" "network" "bluetooth" "pulseaudio" "backlight" "battery" "clock" ];
        "sway/mode" = {
          "format" = "{}";
        };
        "sway/window" = {
          "tooltip" = false;
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
          "tooltip" = false;
        };
        "clock" = {
          "tooltip" = false;
          "interval" = 1;
          "format" = "{:%I:%M}";
          "format-alt" = "{:%d %B %Y, %A}";
        };
        "backlight" = {
          "format" = "{icon}";
          "format-icons" = [ "" "" "" "" ];
        };
        "battery" = {
          "states" = {
            "good" = 90;
            "warning" = 20;
            "critical" = 10;
          };
          "format" = "{icon}";
          "format-alt" = "{icon} {capacity}% ({time})";
          "format-charging" = " {capacity}%";
          "format-plugged" = "‭ﮣ {capacity}%";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" "" "" ];
          "tooltip" = false;
        };
        "network" = {
          "format-wifi" = "直";
          "format-ethernet" = "";
          "format-linked" = "";
          "format-disconnected" = "睊";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
          "tooltip" = false;
        };
        "pulseaudio" = {
          "tooltip" = false;
          "format" = "{icon} {format_source}";
          "format-muted" = "‭ﱝ {format_source}";
          "format-bluetooth" = " {icon} {format_source}";
          "format-bluetooth-muted" = " ‭ﱝ {format_source}";
          "format-source" = "";
          "format-source-muted" = "";
          "format-icons" = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "奄" "奔" "墳" ];
          };
          "on-click" = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
        "bluetooth" = {
          "format" = "";
          "format-connected" = "";
          "format-disabled" = "";
          "format-off" = "";
          "format-connected-battery" = " {device_battery_percentage}%";
          "on-click" = "${pkgs.blueman}/bin/blueman-manager";
        };
        "tray" = {
          "spacing" = 4;
        };
      };
    };
  };
}
