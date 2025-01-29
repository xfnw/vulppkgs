{ stdenvNoCC
, tlsclient
, lib
}:

stdenvNoCC.mkDerivation rec {
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

  meta = {
    # upstream nixpkgs tlsclient package cannot find ar when static
    badPlatforms = [ lib.systems.inspect.platformPatterns.isStatic ];
  };
}
