{ lib, stdenv, fetchFromGitHub, gtk-engine-murrine }:

stdenv.mkDerivation {
  pname = "dracula-gtk";
  version = "4.0";

  src = fetchFromGitHub {
    owner = "dracula";
    repo = "gtk";
    rev = "v4.0";
    sha256 = "sha256-7DUT/DfvCSo9GiJzqhqvegNCARB0eGtPQ6oUQG/Uja0=";
  };

  propagatedUserEnvPkgs = [
    gtk-engine-murrine
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes/Dracula
    cp -a * $out/share/themes/Dracula

    runHook postInstall
  '';
}
