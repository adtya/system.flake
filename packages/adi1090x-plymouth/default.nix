{ pkgs, pack ? "pack_1", theme ? "cuts", ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "adi1090x-plymouth";
  version = "master";

  src = builtins.fetchGit {
    url = "https://github.com/adi1090x/plymouth-themes";
    ref = "master";
    rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
    shallow = true;
  };

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
