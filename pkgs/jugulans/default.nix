{ stdenv
, fetchFromCodeberg
, chicken
, chickenPackages
, lib
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "jugulans";
  version = "1.0.2";

  src = fetchFromCodeberg {
    owner = "mattof";
    repo = "jugulans";
    tag = "v${finalAttrs.version}";
    hash = "sha256-E6B66gDlOR+oQIam1EP71qFiWlFxkRmZQthMzTBZC6I=";
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
