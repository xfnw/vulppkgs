{ stdenv
, fetchFromGitHub
, openssl
}:

stdenv.mkDerivation rec {
  name = "expdays";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "48feef1d879dfa8bd5e1a2c2c53e00d3fca4eb08";
    sha256 = "sha256-wCskhPknfTso3ZYeKfTSATXDyzkZUJh8WP2VV4vQxNU=";
  };

  buildInputs = [ openssl ];

  patchPhase = ''
    sed -i 's#openssl#${openssl}/bin/openssl#' bin/expdays
  '';

  installPhase = ''
    install -D bin/expdays $out/bin/expdays
  '';
}
