{ lib, pkgs, ... }:
let
  gtkTheme = {
    name = "Dracula";
    package = pkgs.dracula-gtk;
  };

  iconTheme = {
    name = "Newaita-dark";
    package = pkgs.newaita-icon-theme.override { panel = "dark"; folder = "bluegrey"; };
  };

  cursorTheme = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
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

  gtk.cursorTheme = cursorTheme;
  xdg.dataFile."icons/${cursorTheme.name}".source = "${cursorTheme.package}/share/icons/${cursorTheme.name}";

  gtk.iconTheme = iconTheme;
  xdg.dataFile."icons/${iconTheme.name}".source = "${iconTheme.package}/share/icons/${iconTheme.name}";

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
