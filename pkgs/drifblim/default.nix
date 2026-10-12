{ stdenv
, stdenvNoCC
, fetchFromSourcehut
, uxncli
}:

let
  uxnasm-archive = stdenv.mkDerivation {
    pname = "uxnasm-archive";
    version = "0-unstable-2025-12-28";

    src = fetchFromSourcehut {
      owner = "~rabbits";
      repo = "uxn";
      rev = "64e9f46f790eec0acafa516bcc325a8b39bcfe98";
      hash = "sha256-k38aGkFT3RljOD3/eqC2r+WTjd/3WrPDGn4TMGwMutw=";
    };

    buildPhase = ''
      $CC -o uxnasm archive/uxnasm.c
    '';

    installPhase = ''
      install -Dt $out/bin uxnasm
    '';
  };

  drifblim-bootstrap = stdenvNoCC.mkDerivation {
    pname = "drifblim-bootstrap";
    version = "0-unstable-2026-06-09";

    src = fetchFromSourcehut {
      owner = "~rabbits";
      repo = "drifblim";
      # last commit that uxnasm can assemble
      rev = "3646d76fcb5caa0868164bdd8d7c3941fe8fc541";
      hash = "sha256-jyhLOJIOfYosXjrVv77kvKsDurz5O3vHEo5DGnCqrY0=";
    };

    buildPhase = ''
      ${uxnasm-archive}/bin/uxnasm src/drifblim.tal drifblim.rom
    '';

    installPhase = ''
      cp drifblim.rom $out
    '';
  };
in stdenvNoCC.mkDerivation {
  pname = "drifblim";
  version = "54K-unstable-2026-09-29";

  src = fetchFromSourcehut {
    owner = "~rabbits";
    repo = "drifblim";
    rev = "ad545c4ce35f738d5c765c21d09442cb361b4fcc";
    hash = "sha256-udq40XkkrPxxCE4iKtNQXzaqAiGvdMp0q055YLyU+o8=";
  };

  buildPhase = ''
    ${uxncli}/bin/uxncli ${drifblim-bootstrap} src/drifblim.tal drifblim.rom
  '';

  installPhase = ''
    install -Dm 444 -t $out/bin drifblim.rom
    # XXX: surely there is a better way to do this built into nixpkgs?
    # i could only find convenience functions for wrapping executables
    cat > $out/bin/drifblim <<EOF
    #!/bin/sh
    ${uxncli}/bin/uxncli $out/bin/drifblim.rom "\$@"
    EOF
    chmod +x $out/bin/drifblim
  '';
}
