{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage {
  pname = "metrics-relay";
  version = "0-unstable-2026-06-16";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "workspace";
    rev = "d19204ddad8882d0c5b61dd725584ac06c319371";
    hash = "sha256-kvziZ2fLCaaY344cA8zftV64vN9fC1CxEGJJNkFqtCQ=";
  };

  cargoHash = "sha256-WqLDY0PQ3hrloYIbhFfrkKIun198gvSH8xoV16rDjHw=";

  buildAndTestSubdir = "crates/metrics-relay";
}
