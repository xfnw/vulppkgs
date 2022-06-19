{ stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "scirc";
  version = "1.4";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "scirc";
    rev = "v${version}";
    sha256 = "sha256-7hmWfr0NxrHy3BlfVgmfDWgjaOHwLl3jG2hDKjRH/Gk=";
  };

  installPhase = ''
    install -D scirc $out/bin/scirc
    install -D scirc.1 $out/man/man1/scirc.1
  '';
}
