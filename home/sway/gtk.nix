{ lib, pkgs, ... }:
let
  gtkTheme = {
    name = "Dracula";
    package = pkgs.dracula-gtk;
  };
in
{
  gtk.enable = true;
  gtk.theme = gtkTheme;
  home.sessionVariables.GTK_THEME = gtkTheme.name;
  xdg.configFile = {
    "gtk-4.0/assets".source = "${gtkTheme.package}/share/themes/${gtkTheme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${gtkTheme.package}/share/themes/${gtkTheme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${gtkTheme.package}/share/themes/${gtkTheme.name}/gtk-4.0/gtk-dark.css";
  };

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
    package = pkgs.catppuccin-papirus-folders.override { flavor = "mocha"; accent = "blue"; };
    name = "Papirus";
  };

  gtk.gtk3.extraConfig = {
    gtk-application-prefer-dark-theme = 1;
  };

  gtk.gtk4.extraConfig = {
    gtk-application-prefer-dark-theme = 1;
  };
}
