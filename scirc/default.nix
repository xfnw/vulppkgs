{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "scirc";
  version = "1.3.1";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "scirc";
    rev = "v${version}";
    sha256 = "sha256-i+qRs4xWDZjJCsrZGUDqwu3OJc4QuPpE9SEE3EZNRPo=";
  };

  installPhase = ''
    install -D scirc $out/bin/scirc
    install -D scirc.1 $out/man/man1/scirc.1
  '';
}
