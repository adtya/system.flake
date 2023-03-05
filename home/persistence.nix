{ ... }: {
  home.persistence."/persist/home" = {
    allowOther = true;
    directories = [
      ".cache/mesa_shader_cache"
      ".cache/mozilla"
      ".config/1Password"
      ".config/discord"
      ".config/spotify"
      ".config/spotify-tui"
      ".gnupg"
      ".local/share/atuin"
      ".local/share/keyrings"
      ".local/share/zsh"
      ".mozilla"
      ".ssh"

      "Desktop"
      "Documents"
      "Downloads"
      "Music"
      "Others"
      "Pictures"
      "Projects"
      "Videos"
    ];

    files = [
      ".config/dconf/user"
      ".config/gh/hosts.yml"
      ".config/user-dirs.dirs"
      ".config/user-dirs.locale"
    ];
  };
}
