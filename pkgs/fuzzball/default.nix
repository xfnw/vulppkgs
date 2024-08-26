{ stdenv
, fetchFromGitHub
, openssl
, pcre
}:

stdenv.mkDerivation rec {
  pname = "fuzzball";
  version = "7.2.1";

  src = fetchFromGitHub {
    owner = "fuzzball-muck";
    repo = "fuzzball";
    rev = "v${version}";
    hash = "sha256-aHOJxEp1wfM+ZZ/lBUVv5C1Vxie3wryerUCSkNG2pgU=";
  };

  buildInputs = [ openssl.dev pcre.dev ];

  configurePhase = ''
    ./configure --with-pcre=${pcre.dev} --with-ssl=${openssl.dev} --prefix=$out
  '';
}
