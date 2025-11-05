{ stdenv
, fetchurl
, autoreconfHook
, SDL_compat
}:

stdenv.mkDerivation (finalAttrs: {
  name = "pom1";
  version = "1.0.0";

  src = fetchurl {
    url = "mirror://sourceforge/project/pom1/pom1/${finalAttrs.version}/pom1-${finalAttrs.version}.tar.gz";
    hash = "sha256-ihCIvhYo9ZPJ0AsOkdR6OCABbU0rgKSwR8/t9hs0ycQ=";
  };

  patches = [
    ./pom1-backspace.patch
    ./pom1-include-stat.patch
    ./pom1-nomousetheft.patch
    ./pom1-screen.patch
  ];

  postPatch = ''
    substituteInPlace src/pom1.in --replace-fail pom1- "$out/bin/pom1-"
  '';

  nativeBuildInputs = [ autoreconfHook SDL_compat ];
  buildInputs = [ SDL_compat ];
  strictDeps = true;
})
