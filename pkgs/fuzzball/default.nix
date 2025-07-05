{ stdenv
, fetchFromGitHub
, fetchpatch
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

  patches = [
    # https://github.com/fuzzball-muck/fuzzball/pull/735
    (fetchpatch {
      name = "tanabi-fix-findnext.patch";
      url = "https://github.com/fuzzball-muck/fuzzball/commit/4d99fdb07b2d213db0ea0829b598f0d2086466f7.patch";
      hash = "sha256-rPVjcG1W5C6v2WBBCXwcAGFeExKqAU8Cb2zSx1njmjk=";
    })

    # https://github.com/fuzzball-muck/fuzzball/pull/753
    (fetchpatch {
      name = "pointsdragon-fix-crash.patch";
      url = "https://github.com/fuzzball-muck/fuzzball/commit/aee082b37d628f4375b4843becdfb9d9ce40f511.patch";
      hash = "sha256-YOnYPRAmnAXnLIWw9Z17L2FE0fEr0+HzNnwWSaIkR4o=";
    })
  ];

  buildInputs = [ openssl.dev pcre.dev ];

  configurePhase = ''
    ./configure --with-pcre=${pcre.dev} --with-ssl=${openssl.dev} --prefix=$out
  '';
}
