{ stdenv
, tlsclient
}:

stdenv.mkDerivation rec {
  inherit (tlsclient) src version;

  pname = "git-remote-hjgit";

  phases = [ "unpackPhase" "patchPhase" "installPhase" ];

  patchPhase = ''
    substituteInPlace ${pname} --replace-fail \
      tlsclient ${tlsclient}/bin/tlsclient
  '';

  installPhase = ''
    install -D ${pname} $out/bin/${pname}
  '';
}
