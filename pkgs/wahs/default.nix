{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2026-03-17";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "aa20c48da18505d351b7ab5ea5fd513a2d63b376";
    hash = "sha256-omH1P1dqOGx0+eMm0TMzsLRJJYYfTPBZWGBz6dQhzS0=";
  };

  cargoHash = "sha256-MGZOfSAclqSF5NLDqZgBNH3xyUR0r32yPY1Q9WcKI8g=";
})
