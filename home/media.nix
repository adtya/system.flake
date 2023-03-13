{ pkgs, ... }: {
  home.packages = with pkgs; [
    celluloid
    spotify
    spotify-tui
    playerctl
  ];
  programs.mpv = {
    enable = true;
    package = pkgs.mpv.override { youtubeSupport = true; };
    config = {
      hwdec = "auto-safe";
      gpu-context = "wayland";
    };
    defaultProfiles = [ "gpu-hq" ];
    scripts = with pkgs.mpvScripts; [ mpris ];
  };
  services = {
    spotifyd = {
      enable = true;
      package = (pkgs.spotifyd.override { withKeyring = true; withMpris = true; });
      settings = {
        global = {
          use_keyring = true;
          use_mpris = true;
          username_cmd = ''
            ${pkgs.libsecret}/bin/secret-tool search --all service spotifyd 2>&1 | grep 'username' | awk -F'= ' '{print $2}'
          '';
          device_name = "Skipperd";
          device_type = "computer";
          backend = "pulseaudio";
          no_audio_cache = true;
          dbus_type = "session";
        };
      };
    };
  };
}
