{ stdenvNoCC
, fetchFromGitHub
, openssl
, python3
, perl
}:

stdenvNoCC.mkDerivation {
  pname = "dotbin";
  version = "0-unstable-2025-02-02";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "c7829b82f645384b570995f2269759aba5a8b638";
    hash = "sha256-fpcozv6DoIj/PuQO9NCCi2MzdGCbFpXmPanBuaNAKGo=";
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
