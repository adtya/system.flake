{ config, lib, pkgs, ... }:

{
  imports = [
    ./waybar.nix
    ./gnome-keyring.nix
    ./wallpapers.nix
    ./gtk.nix
    ./wofi.nix
    ./mako.nix
    ./swayidle.nix
    ./kanshi.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];

  wayland.windowManager.sway.enable = true;
  wayland.windowManager.sway.config.modifier = "Mod4";
  wayland.windowManager.sway.config.bars = [ ];
  wayland.windowManager.sway.config.fonts = {
    names = [ "FiraCode Nerd Font Mono" ];
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
    background = "#282a36";
    focused = {
      background = "#282a36";
      border = "#8be9fd";
      childBorder = "#8be9fd";
      indicator = "#8be9fd";
      text = "#f8f8f2";
    };
    focusedInactive = {
      background = "#282a36";
      border = "#6272a4";
      childBorder = "#6272a4";
      indicator = "#6272a4";
      text = "#f8f8f2";
    };
    placeholder = {
      border = "#f8f8f2";
      background = "#282a36";
      childBorder = "#f8f8f2";
      indicator = "#f8f8f2";
      text = "#f8f8f2";
    };
    unfocused = {
      background = "#282a36";
      border = "#6272a4";
      childBorder = "#6272a4";
      indicator = "#6272a4";
      text = "#6272a4";
    };
    urgent = {
      background = "#282a36";
      border = "#ff5555";
      childBorder = "#ff5555";
      indicator = "#ff5555";
      text = "#ff5555";
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
      "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty ${pkgs.tmux}/bin/tmux -u new";
      "${modifier}+Shift+Return" = "exec ${pkgs.kitty}/bin/kitty";
      "${modifier}+d" = "exec ${pkgs.wofi}/bin/wofi --show drun";
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

      "print" = ''exec ${pkgs.grim}/bin/grim "''$(${pkgs.xdg-user-dirs}/bin/xdg-usr-dir PICTURES)/Screenshots/screenshot-''$(date +%Y-%m-%d-%H-%M-%S).png"'';
      "Shift+print" = ''exec ${pkgs.grim}/bin/grim -g "''$(${pkgs.scrot}/bin/scrot)" ''$(${pkgs.xdg-user-dirs}/bin/xdg-usr-dir PICTURES)/Screenshots/screenshot-''$(date +%Y-%m-%d-%H-%M-%S).png"'';
    };

  wayland.windowManager.sway.config.startup = [
    { command = "~/.config/scripts/chpaper.sh"; always = true; }
    { command = "systemctl --user restart waybar.service"; always = true; }
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
      command = "floating enable, focus";
      criteria = {
        app_id = "mpv";
      };
    }
    {
      command = "floating enable, focus";
      criteria = {
        app_id = "org.gnome.Nautilus";
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
}

