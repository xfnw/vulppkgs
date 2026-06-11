{ stdenv
, fetchurl
, lib
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "reveng";
  version = "3.0.6";

  src = fetchurl {
    url = "mirror://sourceforge/project/reveng/${finalAttrs.version}/reveng-${finalAttrs.version}.tar.gz";
    hash = "sha256-0jD57We9gMwaMaLdw2/VA0tZQNMeDtvRabXzH0dtX7I=";
  };

  configurePhase = lib.optionalString stdenv.targetPlatform.is64bit ''
    substituteInPlace config.h \
      --replace-fail "BMP_BIT   32" "BMP_BIT   64" \
      --replace-fail "BMP_SUB   16" "BMP_SUB   32"
  '';

  installPhase = ''
    install -Dt $out/bin reveng
  '';
})
