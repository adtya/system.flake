{ lib, stdenv, fetchFromGitHub, variant ? "dark", panel ? "dark", folder ? "default" }:

stdenv.mkDerivation {
  pname = "newaita-icons";
  version = "4.0";

  src = fetchFromGitHub {
    owner = "cbrnix";
    repo = "Newaita";
    rev = "c2b596b097a83be23833dc7bc40b5d07a63315e3";
    hash = "sha256-tqtjUy8RjvOu0NaK+iE0R1g7/eqCpmhbdxuNGd/YfSI=";
  };

  installPhase = ''
    runHook preInstall

    THEME_DIR=Newaita
    if [ "${variant}" == "dark" ]; then
      THEME_DIR=Newaita-dark
    fi

    PANEL_DIR=".DP"
    if [ "${panel}" != "dark" ]; then
      PANEL_DIR=".LP"
    fi

    FOLDER_DIR=".places-default"
    if [ -n "${folder}" ]; then
      FOLDER_DIR=".places-${folder}"
    fi

    mkdir -p $out/share/icons/Newaita
    cp -ra ''$THEME_DIR/{actions,apps,devices,emblems,mimetypes,icon-theme.cache,index.theme} $out/share/icons/Newaita/

    cp -ra ''$THEME_DIR/''$PANEL_DIR $out/share/icons/Newaita/panel
    cp -ra ''$THEME_DIR/''$FOLDER_DIR $out/share/icons/Newaita/places

    ln -s $out/share/icons/Newaita/categories ./apps
    ln -s $out/share/icons/Newaita/status ./panel

    runHook postInstall
  '';
}
