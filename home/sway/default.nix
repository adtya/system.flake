{ config, lib, pkgs, ... }:

{
  imports = [
    ./gnome-keyring.nix
    ./gtk.nix
    ./kanshi.nix
    ./mako.nix
    ./rofi
    ./swayidle.nix
    ./wallpapers.nix
    ./waybar
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];

  wayland.windowManager.sway.enable = true;
  wayland.windowManager.sway.package = pkgs.sway;
  wayland.windowManager.sway.config.modifier = "Mod4";
  wayland.windowManager.sway.config.bars = [ ];
  wayland.windowManager.sway.xwayland = true;
  wayland.windowManager.sway.config.fonts = {
    names = [ "FiraCode Nerd Font" ];
    size = 11.0;
  };
  wayland.windowManager.sway.config.input = {
    "type:touchpad" = {
      dwt = "enabled";
      tap = "enabled";
      natural_scroll = "enabled";
      middle_emulation = "enabled";
    };
  };
  wayland.windowManager.sway.systemdIntegration = true;
  wayland.windowManager.sway.wrapperFeatures = {
    gtk = true;
  };
  wayland.windowManager.sway.config.colors = {
    background = "#F8F8F2";
    focused = {
      background = "#6272A4";
      border = "#6272A4";
      childBorder = "#6272A4";
      indicator = "#6272A4";
      text = "#F8F8F2";
    };
    focusedInactive = {
      background = "#44475A";
      border = "#44475A";
      childBorder = "#44475A";
      indicator = "#44475A";
      text = "#F8F8F2";
    };
    placeholder = {
      background = "#282A36";
      border = "#282A36";
      childBorder = "#282A36";
      indicator = "#282A36";
      text = "#F8F8F2";
    };
    unfocused = {
      background = "#282A36";
      border = "#282A36";
      childBorder = "#282A36";
      indicator = "#282A36";
      text = "#BFBFBF";
    };
    urgent = {
      background = "#FF5555";
      border = "#44475A";
      childBorder = "#FF5555";
      indicator = "#FF5555";
      text = "#F8F8F2";
    };
  };

  wayland.windowManager.sway.config.seat = {
    "*" = {
      xcursor_theme = "Bibata-Modern-Classic 24";
    };
  };

  wayland.windowManager.sway.config.keybindings =
    let
      modifier = config.wayland.windowManager.sway.config.modifier;
    in
    lib.mkOptionDefault {
      "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty ${pkgs.tmux}/bin/tmux new";
      "${modifier}+Shift+Return" = "exec ${pkgs.kitty}/bin/kitty";
      "${modifier}+d" = "exec ${pkgs.rofi-wayland}/bin/rofi -show drun";
      "${modifier}+Shift+c" = "reload";
      "${modifier}+l" = "exec ${pkgs.swaylock}/bin/swaylock -f -i /tmp/lockpaper.jpg";
      "${modifier}+Shift+w" = "exec ~/.config/scripts/chpaper.sh";
      "${modifier}+Shift+escape" = "exec ~/.config/scripts/power_menu.sh";
      "${modifier}+f11" = "exec ~/.config/scripts/tmux_sessions.sh";

      "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +5%";
      "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";

      "XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "XF86AudioRaiseVolume" = "exec ~/.config/scripts/volume_up.sh";
      "XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";

      "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
      "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
      "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";

      "print" = ''exec ${pkgs.grim}/bin/grim "''$(${pkgs.xdg-user-dirs}/bin/xdg-user-dir PICTURES)/Screenshots/screenshot-''$(date +%Y-%m-%d-%H-%M-%S).png"'';
      "Shift+print" = ''exec ${pkgs.grim}/bin/grim -g "''$(${pkgs.slurp}/bin/slurp)" "''$(${pkgs.xdg-user-dirs}/bin/xdg-user-dir PICTURES)/Screenshots/screenshot-''$(date +%Y-%m-%d-%H-%M-%S).png"'';
    };

  wayland.windowManager.sway.config.startup = [
    { command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"; }
    { command = "~/.config/scripts/chpaper.sh"; always = true; }
    { command = "systemctl --user restart waybar.service"; always = true; }
    { command = "systemctl --user restart kanshi.service"; always = true; }
  ];

  wayland.windowManager.sway.config.window.commands = [
    {
      command = "floating enable, focus";
      criteria = {
        app_id = "pavucontrol";
      };
    }
    {
      command = "floating enable, focus";
      criteria = {
        app_id = "blueman-manager";
      };
    }
    {
      command = "floating enable, focus";
      criteria = {
        app_id = "solaar";
      };
    }
    {
      command = "floating enable, focus, sticky enable, resize set width 99ppt";
      criteria = {
        app_id = "mpv";
      };
    }
    {
      command = "floating enable, focus";
      criteria = {
        app_id = "eog";
      };
    }
    {
      command = "floating enable, focus";
      criteria = {
        app_id = "io.elementary.files";
      };
    }
    {
      command = "floating enable, focus";
      criteria = {
        app_id = "gnome-system-monitor";
      };
    }
    {
      command = "floating enable, focus";
      criteria = {
        app_id = "virt-manager";
      };
    }
    {
      command = "floating enable, focus";
      criteria = {
        class = "1Password";
      };
    }
    {
      command = "floating enable, focus";
      criteria = {
        app_id = "io.github.celluloid_player.Celluloid";
      };
    }
    {
      command = "floating enable, focus";
      criteria = {
        app_id = "gnome-disks";
      };
    }
    {
      command = "move container to workspace 2, focus";
      criteria = {
        app_id = "firefox";
      };
    }
    {
      command = "move container to workspace 9, focus";
      criteria = {
        class = "Spotify";
      };
    }
  ];

  wayland.windowManager.sway.config.gaps.outer = 2;
  wayland.windowManager.sway.config.gaps.inner = 2;
  wayland.windowManager.sway.config.window.titlebar = false;
  wayland.windowManager.sway.config.floating.titlebar = false;
}

