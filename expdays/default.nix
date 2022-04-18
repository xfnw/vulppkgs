{ stdenv
, fetchFromGitHub
, openssl
}:

stdenv.mkDerivation rec {
  name = "expdays";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "dotfiles";
    rev = "ff0805b2a91634bd2d8c26c017a581f67520cbca";
    sha256 = "sha256-yGwyYSewbaPPjsLkMc5ZxnDHeLF2cZr8vmn1zbTsfAA=";
  };

  buildInputs = [ openssl ];

  patchPhase = ''
    sed -i 's#openssl#${openssl}/bin/openssl#' bin/expdays
  '';

  installPhase = ''
    install -D bin/expdays $out/bin/expdays
  '';
}
