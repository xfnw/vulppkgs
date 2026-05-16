{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "metrics-relay";
  version = "0-unstable-2026-05-16";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "workspace";
    rev = "165a4b868fc5873189fb3fa0b1d89abc2f301bfe";
    hash = "sha256-EdIqOEaOaf71cNQuvvM5bzQZ0+60EL/Bb8oWU45q/qo=";
  };

  cargoHash = "sha256-dBl7a0WpXc7/mOMut6KdoSJuycCavnGWJ/vP7qPi7Jk=";

  buildAndTestSubdir = "crates/metrics-relay";
})
