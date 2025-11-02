{ stdenvNoCC
, fetchFromGitHub
, openssl
, python3
, perl
}:

stdenvNoCC.mkDerivation {
  pname = "dotbin";
  version = "0-unstable-2025-11-01";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "7d9f0637339130505f3e5aee2494176673a1eb78";
    hash = "sha256-M0ZNXowqSxHhCJbWWh4mxWBBEW/28Sl2f2W1jbDYULE=";
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
