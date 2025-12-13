{ stdenvNoCC
, source
, openssl
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "expdays";
  inherit (source) version;

  src = source;

  patchPhase = ''
    substituteInPlace bin/${finalAttrs.pname} --replace-fail \
      openssl ${openssl}/bin/openssl
  '';

  installPhase = ''
    install -Dt $out/bin bin/${finalAttrs.pname}
  '';
})
