{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2025-11-26";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "cb65769374b33e0ea4539a92b27821af8b2fccad";
    hash = "sha256-SnjSgDsxpBQLouP3KG76miFnvj6yWt6iBYorRevxY6k=";
  };

  cargoHash = "sha256-oQUkXOW4tojUz1O24FQ6TjJVGg8yUtI1NVzR5B8fffc=";
})
