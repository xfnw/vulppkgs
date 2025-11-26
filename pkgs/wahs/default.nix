{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2025-11-21";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "273d6b8bb6d6ddf19af3a39b99e8b2423c5b3c29";
    hash = "sha256-3kOkAuw417F9ZzEvGCay+2qSnNrUjnfPnZno3e5ij9U=";
  };

  cargoHash = "sha256-oQUkXOW4tojUz1O24FQ6TjJVGg8yUtI1NVzR5B8fffc=";
})
