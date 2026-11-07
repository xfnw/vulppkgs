{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage {
  pname = "metrics-relay";
  version = "0-unstable-2026-11-07";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "workspace";
    rev = "6525e03d751fca93ba5a20fa58977ed6f110fad3";
    hash = "sha256-t0qS/7zE/qOBf1obvJqm8L7txPpE9UZUkLnaecyCS9s=";
  };

  cargoHash = "sha256-tRNUSR2ezD2WZEJmSnYQfisXGRQHNodCbn6I8tP31Z4=";

  buildAndTestSubdir = "crates/metrics-relay";
}
