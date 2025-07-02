{ stdenvNoCC
, fetchFromGitHub
, openssl
, python3
, perl
}:

stdenvNoCC.mkDerivation {
  pname = "dotbin";
  version = "0-unstable-2025-07-01";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "b3972061713fe198a02c38f8c7f8e3410b528129";
    hash = "sha256-flzy89Hdkd4XFOcWCn4Tg6FfRNTtR7SDJcBueSVjcdo=";
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
