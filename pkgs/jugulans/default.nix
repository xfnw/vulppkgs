{ stdenv
, fetchFromCodeberg
, chicken
, chickenPackages
, lib
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "jugulans";
  version = "1.0.5";

  src = fetchFromCodeberg {
    owner = "mattof";
    repo = "jugulans";
    tag = "v${finalAttrs.version}";
    hash = "sha256-BbqSkM2eO9EIaIRRK8Ou/zEKRWobVFhcEqaZsYLhfHQ=";
  };

  buildInputs = with chickenPackages.chickenEggs; [
    chicken
    csm
    srfi-69
    string-utils
    simple-loops
    shell
  ];

  buildPhase = ''
    ./build.sh
  '';

  installPhase = ''
    install -Dt $out/bin jugulans
  '';

  meta.badPlatforms = [ lib.systems.inspect.platformPatterns.isStatic ];
})
