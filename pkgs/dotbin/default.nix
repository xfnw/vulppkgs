{ stdenvNoCC
, fetchFromGitHub
, openssl
, python3
, perl
}:

stdenvNoCC.mkDerivation {
  pname = "dotbin";
  version = "0-unstable-2025-02-04";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "fb265dd7006612254517d5ad812489396d8553d0";
    hash = "sha256-sVGUhBfS7oLzIk2bvzjLfrNqh2QBFVzR9CMXEgq1P5Y=";
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
