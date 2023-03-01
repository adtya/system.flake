{ pkgs, ... }: {
  home.packages = with pkgs; [
    spotify
    spotify-tui
    playerctl
  ];
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
