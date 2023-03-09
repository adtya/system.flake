self: super: {
  adi1090x-plymouth = super.callPackage ./adi1090x-plymouth { };
  catppuccin-wallpapers = super.callPackage ./catppuccin-wallpapers { };
  dracula-gtk = super.callPackage ./dracula-gtk { };
  lobster-cli = super.callPackage ./lobster-cli { };
  newaita-icon-theme = super.callPackage ./newaita-icon-theme { };
}
