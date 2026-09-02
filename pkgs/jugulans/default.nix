{ stdenv
, fetchFromCodeberg
, chicken
, chickenPackages
, lib
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "jugulans";
  version = "1.0.4";

  src = fetchFromCodeberg {
    owner = "mattof";
    repo = "jugulans";
    tag = "v${finalAttrs.version}";
    hash = "sha256-tw8gHF8+FOP2ItDtxdCfz48gOLA2Jw7PuzGafi3fN64=";
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
