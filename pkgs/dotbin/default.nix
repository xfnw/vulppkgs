{ stdenvNoCC
, fetchFromGitHub
, openssl
, python3
, perl
}:

stdenvNoCC.mkDerivation {
  pname = "dotbin";
  version = "0-unstable-2025-11-02";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "366d87230cfa0a4713638484acf844c183bae626";
    hash = "sha256-3LbnGWXGpZy9Xg2Xs7KSkr/BHf7/LvGEDXk8dRvyGjg=";
  };

  buildInputs = [ python3 perl ];

  patchPhase = ''
    substituteInPlace bin/expdays --replace-fail \
      openssl ${openssl}/bin/openssl
  '';

  installPhase = ''
    install -Dt $out/bin bin/*
  '';

  meta.mainProgram = "expdays";
}
