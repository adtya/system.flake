{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "catppuccin-wallpapers";
  version = "latest";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "wallpapers";
    rev = "0cea4a28451851a637762dec07ec4fb2bfebc421";
    hash = "sha256-B2ncT2qPc0inHHcO1BAZW5of+K0sIdtPcdpqcPUbKBo=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/wallpapers/catppuccin
    find . -type f -regextype egrep -regex ".*\.(jpe?g|png)$" -exec cp {} $out/share/wallpapers/catppuccin/ \;

    runHook postInstall
  '';

  meta = with lib; {
    description = "Wallpapers to match your Catppuccin setups!";
    homepage = "https://github.com/catppuccin/wallpapers";
    license = licenses.mit;
  };
}
