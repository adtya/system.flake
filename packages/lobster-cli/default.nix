{ lib, stdenv, fetchFromGitHub, makeWrapper, fzf, mpv }:

stdenv.mkDerivation {
  pname = "lobster-cli";
  version = "master";

  src = fetchFromGitHub {
    owner = "justchokingaround";
    repo = "lobster";
    rev = "6b48080ba05b173a0c86fc4cef31c852b4c56b81";
    hash = "sha256-UZUS7jIm6Yf5rHKJ32Z1nO/Y3XYoHnxV8YcHfvCtt+A=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp lobster.sh $out/bin/lobster
    chmod +x $out/bin/lobster

    runHook postInstall
  '';

  postInstall = ''
    wrapProgram "$out/bin/lobster" --prefix PATH : ${lib.makeBinPath [ fzf mpv ]}
  '';
}
