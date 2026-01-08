{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2026-01-07";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "94190f3a4d4741b147220f1730fa816b6a0e7a1b";
    hash = "sha256-/XSzFh/odWZI91BeHuncaNxkP0Ra2IJLg/iH90CSTQw=";
  };

  cargoHash = "sha256-q9cqPFUUyMy570Tigc9ixMb87qWaFD1CIPf8PXUUNsM=";
})
