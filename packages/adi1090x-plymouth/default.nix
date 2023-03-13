{ lib, stdenvNoCC, fetchFromGitHub, pack ? "pack_1", theme ? "cuts" }:

stdenvNoCC.mkDerivation {
  pname = "adi1090x-plymouth";
  version = "latest";

  src = fetchFromGitHub {
    owner = "adi1090x";
    repo = "plymouth-themes";
    rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
    sha256 = "sha256-VNGvA8ujwjpC2rTVZKrXni2GjfiZk7AgAn4ZB4Baj2k=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/plymouth/themes/
    cp -r ${pack}/${theme} $out/share/plymouth/themes/adi1090x
    sed -i  "s@\/usr\/@$out\/@" $out/share/plymouth/themes/adi1090x/${theme}.plymouth
    mv $out/share/plymouth/themes/adi1090x/${theme}.plymouth $out/share/plymouth/themes/adi1090x/adi1090x.plymouth
    sed -i 's/${theme}/adi1090x/g' $out/share/plymouth/themes/adi1090x/adi1090x.plymouth
    mv $out/share/plymouth/themes/adi1090x/${theme}.script $out/share/plymouth/themes/adi1090x/adi1090x.script

    runHook postInstall
  '';

  meta = with lib; {
    description = "A hugh collection (80+) of plymouth themes ported from android bootanimations";
    homepage = "https://github.com/adi1090x/plymouth-themes";
    license = licenses.gpl3;
    platform = platforms.linux;
  };
}
