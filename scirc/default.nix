{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "scirc";
  version = "1.6.0";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "scirc";
    rev = "v${version}";
    sha256 = "sha256-UMZPn3oAjxyhG510L8C05RvmZGmx1EybEwbDi1/phiw=";
  };

  installPhase = ''
    install -D scirc $out/bin/scirc
    install -D scirc.1 $out/man/man1/scirc.1
  '';
}
