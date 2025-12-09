{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2025-12-09";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "608388847e4b58bea2fc69d188da2c1c047e33e4";
    hash = "sha256-YqjiIhU4gbbDq0aq/jWoErTcq9V4S/yZ2f5HaCASTm4=";
  };

  cargoHash = "sha256-oQUkXOW4tojUz1O24FQ6TjJVGg8yUtI1NVzR5B8fffc=";
})
