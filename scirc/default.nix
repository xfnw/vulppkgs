{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "scirc";
  version = "1.7.0";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "scirc";
    rev = "v${version}";
    sha256 = "sha256-gGvbY1qp9EyBYdiopna4XJkl4nQsSQ1xyZuwr7j4LKE=";
  };

  installPhase = ''
    install -D scirc $out/bin/scirc
    install -D scirc.1 $out/man/man1/scirc.1
  '';
}
