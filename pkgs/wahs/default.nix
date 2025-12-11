{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2025-12-11";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "88f5c7ad6bc0df7c9d8229798dfdf6c4527a0dc8";
    hash = "sha256-B740LhuL8Bt+OqdvqwMf8kBdiMH6fi82kYAvU3eCxkE=";
  };

  cargoHash = "sha256-oQUkXOW4tojUz1O24FQ6TjJVGg8yUtI1NVzR5B8fffc=";
})
