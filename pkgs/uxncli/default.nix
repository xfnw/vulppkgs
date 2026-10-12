{ stdenv
, fetchFromSourcehut
}:

stdenv.mkDerivation {
  pname = "uxncli";
  version = "79K-unstable-2026-09-23";

  src = fetchFromSourcehut {
    owner = "~rabbits";
    repo = "uxncli";
    rev = "8d8bb97c33e79903640b4d18b2f16e04f9e0f61c";
    hash = "sha256-7lwgOCXry0Xd5G9qXT2QawXJs2ucunUfa/wIcHP8p04=";
  };

  buildPhase = ''
    $CC -o uxncli src/uxncli.c
  '';

  installPhase = ''
    install -Dt $out/bin uxncli
  '';
}
