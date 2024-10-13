{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "fbflut";
  version = "0-unstable-2024-06-02";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "fbflut";
    rev = "5ee837c88fba533892c0a3501071bb142f95ea74";
    hash = "sha256-9FK7fmT1O7zbMTMTuAppB0QBSG8Q2DtV3EVCmVlvcQc=";
  };

  postConfigure = ''
    substituteInPlace Makefile --replace c99 $CC
  '';

  installPhase = ''
    install -D fbflut $out/bin/fbflut
  '';
}
