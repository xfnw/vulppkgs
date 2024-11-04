{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "fbflut";
  version = "0-unstable-2024-11-03";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = pname;
    rev = "4c336453a121e525d8399f578de9b41fd34521b2";
    hash = "sha256-151UxzciRwwHWRTZwddb1mjYwTqxmDkyt3cMrAhxr4c=";
  };

  postConfigure = ''
    substituteInPlace Makefile --replace c99 $CC
  '';

  installPhase = ''
    install -D fbflut $out/bin/fbflut
  '';
}
