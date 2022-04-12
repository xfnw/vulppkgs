{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "scirc";
  version = "1.3";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "scirc";
    rev = "v${version}";
    sha256 = "sha256-xdY1m/zTEKiIO1SFKgxsuCtELSagevmbT6TgdRkLJmA=";
  };

  installPhase = ''
    install -D scirc $out/bin/scirc
  '';
}
