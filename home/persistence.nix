{ ... }: {
  home.persistence."/persist/home" = {
    directories = [
      ".ssh"
      ".gnupg"
      ".mozilla"
      ".config/1Password"
      ".config/spotify"
      ".config/spotify-tui"

      ".local/share/keyrings"
      ".local/share/atuin"

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
