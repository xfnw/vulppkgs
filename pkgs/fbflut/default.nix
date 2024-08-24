{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "fbflut";
  version = "unstable-2024-05-04";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "fbflut";
    rev = "d2577db115aee10f1d29e0ecd02cd8eaa1407a87";
    sha256 = "sha256-SvXDDyz0OV3HjTh8EoXAHcoReXed6wz0yF5qD+u0UNU=";
  };

  postConfigure = ''
    substituteInPlace Makefile --replace c99 $CC
  '';

  installPhase = ''
    install -D fbflut $out/bin/fbflut
  '';
}
