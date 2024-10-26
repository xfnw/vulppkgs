{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "fbflut";
  version = "0-unstable-2024-10-26";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = pname;
    rev = "57e033689df197f06fdaf275aec9cf938cb036d5";
    hash = "sha256-pKJvLEU5gvxXS8cCKPXEPiolWkWstkwCWNPLc87epeo=";
  };

  postConfigure = ''
    substituteInPlace Makefile --replace c99 $CC
  '';

  installPhase = ''
    install -D fbflut $out/bin/fbflut
  '';
}
