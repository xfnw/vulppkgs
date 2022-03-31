{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "scirc";
  version = "1.2";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "scirc";
    rev = "v${version}";
    sha256 = "sha256-bSWxVNSyAN5grBfaSG7hGUnD67LCdY7ru+arF8nRJWU=";
  };

  installPhase = ''
    install -D scirc $out/bin/scirc
  '';
}
