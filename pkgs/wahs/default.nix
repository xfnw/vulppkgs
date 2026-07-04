{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2026-07-03";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "78a87f316c6d2ed34a2bfe066446bfc3f4f09fdd";
    hash = "sha256-SHPLKiPuhzrBta0flaXsvQCOHIpif5uApX6AB470uOE=";
  };

  cargoHash = "sha256-ndchlJ9e8RPdNIsCxwbMX+3rncQLV89SVh2nFeACrB0=";
})
