{ stdenv
, fetchFromGitHub
, ecl
}:

stdenv.mkDerivation rec {
  pname = "commoned";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-FYsQsnsyYTsOjvYGZOub+DTGzyIpx6nbDOASlidpyiA=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ ecl ];

  buildPhase = ''
    # ecl tries to stick stuff in home
    export HOME="$PWD"

    make
  '';

  installPhase = ''
    install -D ce $out/bin/ce
  '';

  meta = {
    mainProgram = "ce";

    # ecl hard-codes gcc's name, which is different for static builds
    broken = stdenv.hostPlatform.isStatic;
  };
}
