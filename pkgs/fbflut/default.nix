{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "fbflut";
  version = "0-unstable-2026-06-13";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = pname;
    rev = "236935abecde35bc49de7737e1633cf4aace8067";
    hash = "sha256-MhQo5VFnUowxMcWewXC1aZhCXOgWjI9Brs+0Qrv5q9Q=";
  };

  postConfigure = ''
    substituteInPlace Makefile --replace-warn c99 $CC
  '';

  installPhase = ''
    install -D fbflut $out/bin/fbflut
  '';
}
