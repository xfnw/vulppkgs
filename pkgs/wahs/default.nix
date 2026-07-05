{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2026-07-05";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "25d7bf8dee47a70efd1e0b8298f3b466a8131e4c";
    hash = "sha256-DJ+k+HYqXu44ifGn65TtW3Puc/sqMwoORqk5kZzHjVA=";
  };

  cargoHash = "sha256-ndchlJ9e8RPdNIsCxwbMX+3rncQLV89SVh2nFeACrB0=";
})
