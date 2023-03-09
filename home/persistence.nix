{ ... }: {
  home.persistence."/persist/home" = {
    allowOther = true;
    directories = [
      ".cache/mesa_shader_cache"
      ".cache/mozilla"
      ".cache/nix"
      ".config/1Password"
      ".config/dconf"
      ".config/discord"
      ".config/lazygit"
      ".config/spotify"
      ".config/spotify-tui"
      ".gnupg"
      ".local/share/atuin"
      ".local/share/emails"
      ".local/share/keyrings"
      ".local/share/nix"
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
    ];
  };
}
