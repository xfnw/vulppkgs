{ stdenvNoCC
, source
, python3
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "pushimap";
  inherit (source) version;

  src = source;

  buildInputs = [ python3 ];
  strictDeps = true;

  installPhase = ''
    install -Dt $out/bin bin/${finalAttrs.pname}
  '';
})
