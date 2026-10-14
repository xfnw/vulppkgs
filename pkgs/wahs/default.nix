{ fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "wahs";
  version = "0-unstable-2026-10-14";

  src = fetchFromGitHub {
    owner = "xfnw";
    repo = "wahs";
    rev = "fdb0991269a260f5582100cb7e75b4cd56eee5e9";
    hash = "sha256-zkNwf5F5STjQAbtp5gMawZW2bAoUNAlWI2wIb4eKJYk=";
  };

  cargoHash = "sha256-e+U5FO3hpgpY8BkylcfYUGPyS7daUFmnjt7MD9tgFDo=";
})
