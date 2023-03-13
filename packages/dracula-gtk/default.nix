{ lib, stdenvNoCC, fetchFromGitHub, gtk3, gnome-themes-extra, gtk-engine-murrine }:

stdenvNoCC.mkDerivation {
  pname = "dracula-gtk";
  version = "4.0";

  src = fetchFromGitHub {
    owner = "dracula";
    repo = "gtk";
    rev = "v4.0";
    sha256 = "sha256-7DUT/DfvCSo9GiJzqhqvegNCARB0eGtPQ6oUQG/Uja0=";
  };

  nativeBuildInputs = [ gtk3 ];

  buildInputs = [
    gnome-themes-extra
  ];

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes/Dracula
    cp -ra assets cinnamon gnome-shell gtk-2.0 gtk-3.0 gtk-3.20 gtk-4.0 metacity-1 unity xfwm4 index.theme $out/share/themes/Dracula/

    runHook postInstall
  '';
  meta = with lib; {
    description = "Dracula GTK theme";
    homepage = "https://draculatheme.com/gtk";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
