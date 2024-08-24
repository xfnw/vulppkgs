{ stdenv
, fetchFromGitHub
, ecl
}:

stdenv.mkDerivation rec {
  pname = "commoned";
  version = "0-unstable-2024-08-17";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = pname;
    rev = "30818f5f6bf33fd1113a507dc969289c4df95e58";
    hash = "sha256-DiKZzzqtiGAbuqXjW7jvLrvSTCc1EuHK3/GNzvd6pRk=";
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

  meta.mainProgram = "ce";
}
