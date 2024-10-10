{ stdenvNoCC
, fetchFromGitHub
, openssl
}:

stdenvNoCC.mkDerivation {
  name = "expdays";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "909c74c8387fe0613b9c5d058272b41e1421d725";
    sha256 = "sha256-PTzUuCjoS34CmORclEJWkvJt+yOLd1/hG5pG5kTnoy8=";
  };

  buildInputs = [ openssl ];

  patchPhase = ''
    sed -i 's#openssl#${openssl}/bin/openssl#' bin/expdays
  '';

  installPhase = ''
    install -D bin/expdays $out/bin/expdays
  '';
}
