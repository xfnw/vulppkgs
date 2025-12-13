{ stdenvNoCC
, source
, squashfsTools
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "nix2tcz";
  inherit (source) version;

  src = source;

  patchPhase = ''
    substituteInPlace bin/${finalAttrs.pname} --replace-fail \
      mksquashfs ${squashfsTools}/bin/mksquashfs
  '';

  installPhase = ''
    install -Dt $out/bin bin/${finalAttrs.pname}
  '';
})
