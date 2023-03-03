{ pkgs }:
pkgs.stdenv.mkDerivation rec {
  pname = "adi1090x-plymouth";
  version = "0.0.1";

  src = builtins.fetchGit {
    url = "https://github.com/adi1090x/plymouth-themes";
    ref = "master";
    rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
  };

  buildInputs = [
    pkgs.git
  ];

  configurePhase = ''
    mkdir -p $out/share/plymouth/themes/
  '';

  buildPhase = ''
  '';

  installPhase = ''
      cp -r pack_4/rog_2 $out/share/plymouth/themes
    cat pack_4/rog_2/rog_2.plymouth | sed  "s@\/usr\/@$out\/@" > $out/share/plymouth/themes/rog_2/rog_2.plymouth
  '';
}
