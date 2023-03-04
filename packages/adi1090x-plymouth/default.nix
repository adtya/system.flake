{ pkgs, pack ? "pack_1", theme ? "cuts", ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "adi1090x-plymouth";
  version = "0.0.1";

  src = pkgs.fetchgit {
    url = "https://github.com/adi1090x/plymouth-themes";
    rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
    hash = "sha256-VNGvA8ujwjpC2rTVZKrXni2GjfiZk7AgAn4ZB4Baj2k=";
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
    cp -r ${pack}/${theme} $out/share/plymouth/themes/adi1090x
    sed -i  "s@\/usr\/@$out\/@" $out/share/plymouth/themes/adi1090x/${theme}.plymouth
    mv $out/share/plymouth/themes/adi1090x/${theme}.plymouth $out/share/plymouth/themes/adi1090x/adi1090x.plymouth
    sed -i 's/${theme}/adi1090x/g' $out/share/plymouth/themes/adi1090x/adi1090x.plymouth
    mv $out/share/plymouth/themes/adi1090x/${theme}.script $out/share/plymouth/themes/adi1090x/adi1090x.script
  '';
}
