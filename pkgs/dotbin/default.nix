{ stdenvNoCC
, fetchFromGitHub
, openssl
, python3
, perl
}:

stdenvNoCC.mkDerivation {
  pname = "dotbin";
  version = "0-unstable-2025-06-07";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "f9509aaebe4b447c196dc1350299db081dd8bb6d";
    hash = "sha256-tKtpVefORwIpDxXuCwAOCyG7B1awe35Ke5g4BkIpLP4=";
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
