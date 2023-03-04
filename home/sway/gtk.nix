{ pkgs, ... }:

{
  gtk.enable = true;
  gtk.theme = {
    name = "Dracula";
    package = pkgs.dracula-theme;
  };
  home.sessionVariables.GTK_THEME = "Dracula";

  gtk.cursorTheme = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
  };

  home.file.".local/share/icons".source = builtins.fetchGit {
    url = "https://github.com/cbrnix/Newaita.git";
    ref = "master";
    rev = "c2b596b097a83be23833dc7bc40b5d07a63315e3";
    shallow = true;
  };
  gtk.iconTheme = {
    name = "Newaita-dark";
  };

  gtk.gtk3.extraConfig = {
    Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };

  gtk.gtk4.extraConfig = {
    Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };
}
