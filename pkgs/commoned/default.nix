{ stdenv
, fetchFromGitHub
, ecl
}:

stdenv.mkDerivation rec {
  pname = "commoned";
  version = "0-unstable-2024-10-27";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = pname;
    rev = "6197563a3597e3a54368a580b2c46cd31d1ce6c2";
    hash = "sha256-w4LYhZrCFgGzo+8uG8Mbb4exHr4GexjU+LkqTySFi6s=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ ecl ];

  buildPhase = ''
    # ecl tries to stick stuff in home
    export HOME="$PWD"

    make
  '';

  installPhase = ''
    install -D ce $out/bin/ce
  '';

  meta.mainProgram = "ce";
}
