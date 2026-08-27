{ stdenv
, fetchFromCodeberg
, chicken
, chickenPackages
, lib
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "jugulans";
  version = "1.0.3";

  src = fetchFromCodeberg {
    owner = "mattof";
    repo = "jugulans";
    tag = "v${finalAttrs.version}";
    hash = "sha256-IgsynM1PWd9zPsp25fFs7+PVzUGeeYg1+NcVybtElR8=";
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
