{ stdenv
, fetchFromGitHub
, openssl
}:

stdenv.mkDerivation rec {
  name = "expdays";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "165874090836ca5b183f45309c438056af544740";
    sha256 = "sha256-09g1kVVvEjSLe8W58xjXNRJqY0Zn/UKLyl/S5d0OkyE=";
  };

  buildInputs = [ openssl ];

  patchPhase = ''
    sed -i 's#openssl#${openssl}/bin/openssl#' bin/expdays
  '';

  installPhase = ''
    install -D bin/expdays $out/bin/expdays
  '';
}
