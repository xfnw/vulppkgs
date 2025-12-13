{ stdenvNoCC
, source
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "taint";
  inherit (source) version;

  src = source;

  installPhase = ''
    install -Dt $out/bin bin/${finalAttrs.pname}
  '';
})
