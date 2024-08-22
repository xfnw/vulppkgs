{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "scirc";
  version = "1.7.2";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "scirc";
    rev = "v${version}";
    sha256 = "sha256-21esUUdqyyayphRyR+OrG6YAZsk7gTPvL9M7bgVdXqw=";
  };

  installPhase = ''
    install -D scirc $out/bin/scirc
    install -D scirc.1 $out/man/man1/scirc.1
  '';
}
