{ lib, pkgs, ... }:
let
  gtkTheme = {
    name = "Dracula";
    package = pkgs.dracula-gtk;
  };
  iconTheme = {
    package = pkgs.newaita-icons.override { variant = "dark"; panel = "dark"; folder = "bluegray"; };
    name = "Newaita";
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

  gtk.iconTheme = iconTheme;
  xdg.dataFile = {
    "icons/${iconTheme.name}".source = "${iconTheme.package}/share/icons/${iconTheme.name}";
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
