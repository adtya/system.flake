{ ... }: {
  home.persistence."/persist/home" = {
    allowOther = true;
    directories = [
      ".cache/mesa_shader_cache"
      ".cache/mozilla"
      ".config/1Password"
      ".config/dconf"
      ".config/discord"
      ".config/spotify"
      ".config/spotify-tui"
      ".gnupg"
      ".local/share/atuin"
      ".local/share/keyrings"
      ".local/share/zsh"
      ".mozilla"
      ".ssh"

      ".system.flake"

      "Documents"
      "Downloads"
      "Music"
      "Others"
      "Pictures"
      "Projects"
      "Videos"
    ];

    files = [
      ".config/gh/hosts.yml"
      ".config/user-dirs.dirs"
      ".config/user-dirs.locale"
    ];
  };
}
