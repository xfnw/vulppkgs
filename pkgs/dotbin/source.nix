{ stdenvNoCC
, fetchFromGitHub
}:

stdenvNoCC.mkDerivation {
  pname = "dotbin";
  version = "0-unstable-2026-11-14";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "f40a1a8840c5e94a6258d0c6b31b1011fbd75355";
    hash = "sha256-jDTWqoGk+p2leK841RNL6z7C/NPDBm7Q9CADKLF54/U=";
  };

 installPhase = ''
   install -Dt $out/bin bin/*
 '';
}
