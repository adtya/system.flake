{ ... }: {
  home.persistence."/persist/home" = {
    allowOther = true;
    directories = [
      ".cache/mesa_shader_cache"
      ".cache/mozilla"
      ".config/1Password"
      ".config/spotify"
      ".config/spotify-tui"
      ".gnupg"
      ".local/share/keyrings"
      ".local/share/atuin"
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
      ".zsh_history"
      ".config/gh/hosts.yml"
      ".config/user-dirs.dirs"
      ".config/user-dirs.locale"
    ];
  };
}
