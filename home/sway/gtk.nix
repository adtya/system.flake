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

  home.file.".local/share/icons".source = pkgs.fetchFromGitHub {
    owner = "cbrnix";
    repo = "Newaita";
    rev = "c2b596b097a83be23833dc7bc40b5d07a63315e3";
    hash = "sha256-tqtjUy8RjvOu0NaK+iE0R1g7/eqCpmhbdxuNGd/YfSI=";
  };
  gtk.iconTheme = {
    package = pkgs.catppuccin-papirus-folders.override { flavor = "mocha"; accent = "blue"; };
    name = "Papirus";
  };

  gtk.gtk3.extraConfig = {
    gtk-application-prefer-dark-theme = true;
  };

  gtk.gtk4.extraConfig = {
    gtk-application-prefer-dark-theme = true;
  };

  dconf.settings = {
    "org.gnome.desktop.interface" = {
      "color-scheme" = "prefer-dark";
    };
  };
}
