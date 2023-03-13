{ lib, stdenvNoCC, fetchFromGitHub, gtk3, gnome, gnome-icon-theme, hicolor-icon-theme, panel ? "dark", folder ? "default" }:

stdenvNoCC.mkDerivation {
  pname = "newaita-icon-theme";
  version = "latest";

  src = fetchFromGitHub {
    owner = "cbrnix";
    repo = "Newaita";
    rev = "c2b596b097a83be23833dc7bc40b5d07a63315e3";
    hash = "sha256-tqtjUy8RjvOu0NaK+iE0R1g7/eqCpmhbdxuNGd/YfSI=";
  };

  nativeBuildInputs = [ gtk3 ];

  propagatedBuildInputs = [
    gnome.adwaita-icon-theme
    gnome-icon-theme
    hicolor-icon-theme
  ];

  dontDropIconThemeCache = true;

  installPhase = ''
    runHook preInstall

    PANEL_DIR=".DP"
    if [ "${panel}" != "dark" ]; then
      PANEL_DIR=".LP"
    fi

    FOLDER_DIR=".places-${folder}"

    mkdir -p $out/share/icons/Newaita{,-dark}
    cp -ra Newaita/{actions,apps,categories,devices,emblems,mimetypes,status,icon-theme.cache,index.theme} $out/share/icons/Newaita/
    cp -ra Newaita-dark/{actions,apps,categories,devices,emblems,mimetypes,status,icon-theme.cache,index.theme} $out/share/icons/Newaita-dark/

    cp -ra Newaita/''$PANEL_DIR $out/share/icons/Newaita/panel
    cp -ra Newaita-dark/''$PANEL_DIR $out/share/icons/Newaita-dark/panel

    cp -ra Newaita/''$FOLDER_DIR $out/share/icons/Newaita/places
    cp -ra Newaita-dark/''$FOLDER_DIR $out/share/icons/Newaita-dark/places

    runHook postInstall
  '';

  postFixup = "gtk-update-icon-cache $out/share/icons/Newaita{,-dark}";

  meta = with lib; {
    description = "Newaita icon theme";
    homepage = "https://github.com/cbrnix/Newaita";
    platforms = platforms.linux;
  };
}
