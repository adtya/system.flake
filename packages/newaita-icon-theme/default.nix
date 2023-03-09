{ lib, stdenv, fetchFromGitHub, panel ? "dark", folder ? "default" }:

stdenv.mkDerivation {
  pname = "newaita-icon-theme";
  version = "master";

  src = fetchFromGitHub {
    owner = "cbrnix";
    repo = "Newaita";
    rev = "c2b596b097a83be23833dc7bc40b5d07a63315e3";
    hash = "sha256-tqtjUy8RjvOu0NaK+iE0R1g7/eqCpmhbdxuNGd/YfSI=";
  };

  installPhase = ''
    PANEL_DIR=".DP"
    if [ "${panel}" != "dark" ]; then
      PANEL_DIR=".LP"
    fi

    FOLDER_DIR=".places-default"
    if [ -n "${folder}" ]; then
      FOLDER_DIR=".places-${folder}"
    fi

    mkdir -p $out/share/icons/Newaita{,-dark}
    cp -ra Newaita/{actions,apps,categories,devices,emblems,mimetypes,status,icon-theme.cache,index.theme} $out/share/icons/Newaita/
    cp -ra Newaita-dark/{actions,apps,categories,devices,emblems,mimetypes,status,icon-theme.cache,index.theme} $out/share/icons/Newaita-dark/

    cp -ra Newaita/''$PANEL_DIR $out/share/icons/Newaita/panel
    cp -ra Newaita-dark/''$PANEL_DIR $out/share/icons/Newaita-dark/panel

    cp -ra Newaita/''$FOLDER_DIR $out/share/icons/Newaita/places
    cp -ra Newaita-dark/''$FOLDER_DIR $out/share/icons/Newaita-dark/places
  '';
}
